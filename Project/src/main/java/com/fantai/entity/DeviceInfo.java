package com.fantai.entity;

import java.sql.Timestamp;

public class DeviceInfo {

    private Integer se_hr_id;
    private Timestamp se_hr_time;
    private Double se_hr_tem;
    private Double se_hr_hum;
    private Double se_hr_pressure;
    private Double se_hr_electric;
    private String sy_di_code;
    private String se_hr_cont_code;

    public Integer getSe_hr_id() {
        return se_hr_id;
    }

    public Timestamp getSe_hr_time() {
        return se_hr_time;
    }

    public Double getSe_hr_tem() {
        return se_hr_tem;
    }

    public Double getSe_hr_hum() {
        return se_hr_hum;
    }

    public void setSe_hr_id(Integer se_hr_id) {
        this.se_hr_id = se_hr_id;
    }

    public void setSe_hr_time(Timestamp se_hr_time) {
        this.se_hr_time = se_hr_time;
    }

    public void setSe_hr_tem(Double se_hr_tem) {
        this.se_hr_tem = se_hr_tem;
    }

    public void setSe_hr_hum(Double se_hr_hum) {
        this.se_hr_hum = se_hr_hum;
    }

    public void setSe_hr_pressure(Double se_hr_pressure) {
        this.se_hr_pressure = se_hr_pressure;
    }

    public void setSe_hr_electric(Double se_hr_electric) {
        this.se_hr_electric = se_hr_electric;
    }

    public void setSy_di_code(String sy_di_code) {
        this.sy_di_code = sy_di_code;
    }

    public void setSe_hr_cont_code(String se_hr_cont_code) {
        this.se_hr_cont_code = se_hr_cont_code;
    }

    public Double getSe_hr_pressure() {

        return se_hr_pressure;
    }

    public Double getSe_hr_electric() {
        return se_hr_electric;
    }

    public String getSy_di_code() {
        return sy_di_code;
    }

    public String getSe_hr_cont_code() {
        return se_hr_cont_code;
    }
}
