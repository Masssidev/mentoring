package net.skhu.model;

import lombok.Data;

@Data
public class Pagination {

	int bd;      // boardId
    int pg = 1;  // 현재 페이지
    int sz = 15; // 페이지 당 레코드 수
    int recordCount;

    public int getBd() {
		return bd;
	}

	public void setBd(int bd) {
		this.bd = bd;
	}

	public int getPg() {
		return pg;
	}

	public void setPg(int pg) {
		this.pg = pg;
	}

	public int getSz() {
		return sz;
	}

	public void setSz(int sz) {
		this.sz = sz;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public String getQueryString() {
    	String url = String.format("bd=%d&pg=%d&sz=%d", bd, pg, sz);
        return url;
    }
}
