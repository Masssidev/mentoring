package net.skhu.model;

public class ReportPagination {

	int pg = 1; // 현재 페이지
	int sz = 15; // 페이지 당 레코드 수
	int ob; // order by
	int recordCount;

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

	public int getOb() {
		return ob;
	}

	public void setOb(int ob) {
		this.ob = ob;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public String getQueryString() {
		String url = String.format("pg=%d&sz=%d&ob=%d", pg, sz, ob);
		return url;
	}

}
