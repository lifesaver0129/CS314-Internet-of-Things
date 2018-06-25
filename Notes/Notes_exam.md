## Internet of Things

### Definition 

The concept of the Internet of Things (IoT) is to make every **single ‘network enabled’ object** in the world **network connected**, and represents a vision in which the Internet extends into the real world embracing everyday objects. 

One of the definitions of the IoT described it as a self-configured dynamic **global network** **infrastructure** with standards and interoperable communication protocols where **physical and virtual ‘things’** have identities, physical attributes, and virtual personalities, and are seamlessly **integrated into** the information **infrastructure**. 

### More Definitions

There are many definitions of the Internet of Things in the research and relevant industrial communities. The definitions may rise from the word ‘Internet’ or ‘things’ and lead to 

- an ‘Internet oriented’ vision, 
- or a ‘things oriented’ vision

A world-wide network of interconnected objects uniquely addressable, based on standard communication protocols.

An integrated part of the future Internet, an extension of the Internet to reach out to the physical world of things and places that only can support low-end computers 

### Applications

The deployment of smart ‘network enabled’ objects with communication, sensory and action capabilities for numerous applications such as in 

* the areas of healthcare, 
* smart buildings, 
* social networks, 
* environment monitoring, 
* transportation and 
* logistics, etc.

All applications of the IoT rely on the data collected from distributed smart ‘network enabled’ objects and the IoT information infrastructure for data transmission

### Feature

The IoT is a global and real-time solution; It is mainly wireless oriented and able to provide comprehensive data about its surroundings in both indoor and outdoor environments; and It has the ability of remotely monitoring the environment and tracing or tracking objects



##  Wireless Sensor Networks 

### Defination

Low-power, wireless sensor nodes with tiny amount of CPU/memory Networked for high-resolution sensing of environment 

### Applications

* Home automation
* Telehealth care
* Remote control
* Advanced metering
* Intelligent lighting control
* Area monitoring

### WSN embedded software design  

* **Hardware Layer**: Sensordriver 
* **Medium Access Control Layer**: Local wireless communication; Two basic device types: Full Function Device (FFD) and Reduced Function Device (RFD) 
* **Network Layer**: Establishment of self-organized, ad hoc network; implementation of routing protocol 
* **Application Layer**: Data processing, interface design, data communication between remote system and local WSNs 

### Topology

* **Star topology**: The network coordinator is a FFD; all devices must connect to the network coordinator 
* **Tree topology**: The network coordinator is a FFD; router node can adopt children nodes, including router node and end device node 
* **Mesh topology**: The network coordinator is a FFD; router node can adopt children nodes, can freely talk to any other router nodes

### Network Role 

#### Coordinator 

An FFD and responsible for overall network management. Each network has exactly one coordinator. The coordinator performs the following functions:

* Select the channel to be used by the network
* Starts the network
* Assigns how addresses are allocated to nodes or routers
* Permits other devices to join or leave the network
* Holds a list of neighbours and routers
* Transfer application packets 

#### Router 

An FFD and used in tree and mesh topologies to expand network coverage. The function is to find the best route to the destination over which to transfer a message. A router performs all functions similar to a coordinator except the establishment of a network 

#### End Device

An RFD, and can be connected to a router or coordinator. The end device performs the following functions:

* Join or leaves a network
* Transfer application packets 



## Routing

### Challenge

* Limited wireless transmission range 
* Broadcast nature of the wireless medium
  * Hidden terminal problem 
* Packet losses due to transmission errors
* Mobility-induced route changes
* Mobility-induced packet losses
* Battery constraints (Power Control)
* Ease of snooping on wireless transmissions (security hazard) 

### Difference in Ad Hoc Network

* Host Mobility 
* Rate of link failure/repair may be high when nodes move fast 
* New performance criteria may be used 

### Traditional Routing Algorithms 

* Distance Vector: Periodic exchange of messages with all physical neighbors that contain information about who can be reached at what distance 
* Link State: Periodic notification of all routers about the current state of all physical links 

### Ideal routing protocol 

* Low overhead route computation
* Ability to recover from frequent failures at low-cost
* Scalable (with respect to mobility and number of hosts)
* Robust 

### Classification

* Flat
  *  Proactive Protocols (Actively seeks for routes) **DSDV**
    * Determine routes independent of traffic pattern
    * Traditional link-state and distance-vector routing protocols are proactive 
    * Not well-suited for a dynamic network like Ad Hoc Networks 
    * For example, consider link-state routing that sends out network- wide floods for every link-state change 
    * Even in the absence of any existing connections, considerable overhead spent in maintaining “network state” 
  * Reactive Protocols (seeks for routes only when required) **DSR ADOV**
    * Maintain routes only if needed 
    * Even if network state changes, any re-computation done only when any existing connections are affected 
    * Proactive schemes based on distance-vector and link-state mechanisms have also been proposed 
  * Hybrid Routing Protocols  
* Hierarchical Routing
* Geographic Position Assisted Routing

### Dynamic Source Routing (DSR) 

* On-demand 
* Intermediate hosts forward packet based on source route 

* When node S wants to send a packet to node D, but does not know a route to D, node S initiates a Route Discovery 

#### Route discovery

* Every route request packet (RREQ) contains\<target address, initiator address, route record, request ID> 
* Each node maintains a list of the \< initiator address, request ID> 
* When a node Y receives a RREQ
  * Discards the route request packet 
    * if \< initiator address, request ID> is in its list
  * Return a route reply packet which contains a route from initiator to target 
    * If Y is target 
    * If Y has an entry in its route cache for a route to target
* Append itself address to the route record in RREQ and re-broadcast RREQ 
* Optimizations
  * Limit broadcasting if maximum diameter of the network is known
  * Caching of address lists (i.e. paths) with help of passing packets 

#### Route maintance 

* After sending a packet
  * Wait for a layer 2 acknowledgement (if applicable)
  * Listen into the medium to detect if other stations forward the packet
  * Request an explicit ACK 
* If a station encounters problems it can inform the sender of a packet or look-up a new path locally 

#### Cache

- When node S learns that a route to node D is broken, it uses another route from its local cache, if such a route to D exists in its cache. 
- Otherwise, node S initiates route discovery by sending a route request 
- Node X on receiving a Route Request for some node D can send a Route Reply 
- Can speed up route discovery and reduce propagation of route requests 

#### Advantages  

* Routes maintained only between nodes who need to communicate
* Route caching can further reduce route discovery overhead 
* A single route discovery may yield many routes to the destination, due to intermediate nodes replying from local caches 

#### Drawbacks  

* Packet header size grows with route length 
* Care must be taken to avoid collisions between route requests propagated by neighboring nodes 

### Ad Hoc On-Demand Distance Vector Routing (AODV) 

* AODV attempts to improve on DSR by maintaining routing tables at the nodes, so that data packets do not have to contain paths 
* AODV retains the desirable feature of DSR that routes are maintained only between nodes which need to communicate 
* When the intended destination receives a RREQ, it replies by sending a Route Reply (RR)
* RR travels along the reverse path set-up when RREQ was forwarded 
* Each node maintains its own sequence number and a broadcast ID. 
* The broadcast ID is incremented for every RREQ the node initiates 
* The node’s IP address and the broadcast ID uniquely identify a RREQ. 
* Along with its own sequence number and broadcast ID, the source node includes in the RREQ the most recent sequence number it has for the destination. 
* At most one next-hop per destination maintained at each node 

### Destination-Sequenced Distance-Vector (DSDV)  

* Each node maintains a routing table which stores 
* Next hop towards each destination 
* A cost metric for the path to each destination 
* A destination sequence number that is created by the destination itself
* Each node periodically forwards the routing table to its neighbors 
* Each node increments and appends its sequence number when sending its local routing table 
* This sequence number will be attached to route entries created for this node 
* Advantage
  * Simple (similar to Distance Vector)
  * Loop free through destination sequence numbers • No latency caused by route discovery 
* Disadvantages
  * No sleeping nodes
  * Overhead: most routing information never used • Poor Scalability 



## Interference

### Types

* Multiple (more than two) simultaneous packet transmissions causing packets to collide at the receiver (mainly considered in this study)
* Physical factors in the radio propagation channel, such as multipath propagation and reflection
* Interference on the 2.4 ISM GHz Bands. Different devices (near to each other), using the same channel (nearly the same channel)

 ### Examples

* Hidden Terminal Problem 
  * 2 packets arrive at receiver at the same time
* (Not included) Exposed Terminal Problem
  * Sensor senses channel and finds target to be busy and stays quiet  
* Thermal noise, man-made noise, multipath effect, receiver noise
* Possible interferers which may affect the operations of 
  * IEEE 802.15.4/ZigBee
  * WiFi (IEEE 802.11b/g/n)
  * Bluetooth Pico-Nets
  * Microwave ovens

 ### Avoidance

* CS**MA/CA**: Carrier-sense multiple access with collision avoidance
  * Sender sends RTS (Request To Send) 
  * Receiver (if free) sends CTS (Clear To Send) 
  * Sender sends DATA 
* CS**MA/CD**: Carrier-sense multiple access with collision detection
  * For wired network, detect if any other cabled network is also sending, then both of them pause for a random time
* Channel estimation before transmission
* Physical separation. dynamic channel switching. network planning



## Big data

### Characteristics: 4V 

* Volume  
* Velocity 
* Veracity
* Variety
  * Structured data 
  * Unstructured data
  * Semi-structured data 

 ### Applications

* Multi-channel sales 
* Finance 
* Homeland Security 
* Traffic Control 
* Telecom 
* Search Quality 

### Data Repository 

* Data warehouse: integrating data from multiple heterogeneous sources 
* Data lake: large-scale storage repository and processing engine 
* Data mart:  small slices of the data warehouse
* Data workspace (analytic sandbox): gathered from multiple sources and technologies for analysis 

### Cloud Computing 

* Software as a service (SaaS) 
* Platform as a service (PaaS) 
* Infrastructure as a service (IaaS)

### Technologies

#### NoSQL Databases (Not only SQL)  

* Huge horizontal scaling and high availability and highly optimized for retrieval and appending 
* Focus on retrieval of data and appending new data and key-value data stores that can be used to locate data objects, No ACID (atomicity, consistency, isolation, durability)

#### Hadoop 

* Hadoop is a distributed file system and data processing engine that is designed to handle extremely high volumes of data in any structure. 
* Hadoop distributed file system (HDFS), which supports data in structured relational form, in unstructured form, and in any form in between, a file system that can store very large data sets by scaling out across a cluster of hosts.
  * Load data into the cluster (HDFS writes)
  * Analyse the data (MapReduce) 
  * Store results in the cluster (HDFS writes) 
  * Read the results from the cluster (HDFS reads) 
* MapReduce programming paradigm for managing applications on multiple distributed servers, a data processing paradigm that takes as pecification of how the data will be input and output from its two stages (called map and reduce) and then applies this across arbitrarily large data sets. 
  * Map step: input data will be split into smaller chunks to be analyzed and transformed by processes called “mapper”. 
  * Reduce step: the output of the mapper will be sent into the reduce jobs and to sort and aggregate the information given by the mappers



## Mentions

* What is Internet ?
  * Millions of connected computing devices: hosts, end-systems, communication links, routers, protocols
  * Network of networks
  * Communication infrastructure enables distributed applications
* Internet Structure
  * roughly hierarchical 
  * At center: 􏰁tier-1􏰀 ISPs: national/international coverage 
  * 􏰁Tier-2􏰀 ISPs: smaller (often regional) ISPs  
  * 􏰁Tier-3􏰀 ISPs and local ISPs  
* The OSI(Open Systems Interconnection) model
  * Application, presentation, session, transport, network, data link, physical
* Wireless networks
  * **WAN** – Wide Area Network (3G, WiMAX), 2500 meters, GSM, GPRS
  * **LAN** – Local Area Network (WiFi), 100 meters, 802.11b
  * **PAN** – Personal Area Network (ZigBee, 6LowPAN), low-power, 10 meters, Bluetooth, IR, HomeRF
* Network evolution
  - 1G
    - FDMA: Frequency Divided Multiple Access 
    - Circuit-switched, analog signals, Voice only 
  - 2G
    - TDMA: Time Divided Multiple Access 
    - GSM: Global System for Mobile Communications
    - Circuit-switched, digital signals, voice or data overlay, 9 kbps or 19 kbps 
  - 2.5G
    - GPRS, first packet data service on wireless digital networks, 115 kbps 
  - 3G
    - WCDMA, CDMA: Code Divided Multiple Access  
    - Packet-switched, Transparent roaming, 2Mbps, Identification of caller location 
