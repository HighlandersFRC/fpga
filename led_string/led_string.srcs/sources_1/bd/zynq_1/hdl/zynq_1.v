`timescale 1 ps / 1 ps

module m00_couplers_imp_1N1SYRA
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [8:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [8:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire [0:0]S_ARESETN_1;
  wire [31:0]auto_pc_to_m00_couplers_ARADDR;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [31:0]auto_pc_to_m00_couplers_AWADDR;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [31:0]auto_pc_to_m00_couplers_RDATA;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [31:0]auto_pc_to_m00_couplers_WDATA;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [3:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_pc_ARADDR;
  wire [1:0]m00_couplers_to_auto_pc_ARBURST;
  wire [3:0]m00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]m00_couplers_to_auto_pc_ARID;
  wire [7:0]m00_couplers_to_auto_pc_ARLEN;
  wire [0:0]m00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_pc_ARPROT;
  wire [3:0]m00_couplers_to_auto_pc_ARQOS;
  wire m00_couplers_to_auto_pc_ARREADY;
  wire [3:0]m00_couplers_to_auto_pc_ARREGION;
  wire [2:0]m00_couplers_to_auto_pc_ARSIZE;
  wire m00_couplers_to_auto_pc_ARVALID;
  wire [31:0]m00_couplers_to_auto_pc_AWADDR;
  wire [1:0]m00_couplers_to_auto_pc_AWBURST;
  wire [3:0]m00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]m00_couplers_to_auto_pc_AWID;
  wire [7:0]m00_couplers_to_auto_pc_AWLEN;
  wire [0:0]m00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_pc_AWPROT;
  wire [3:0]m00_couplers_to_auto_pc_AWQOS;
  wire m00_couplers_to_auto_pc_AWREADY;
  wire [3:0]m00_couplers_to_auto_pc_AWREGION;
  wire [2:0]m00_couplers_to_auto_pc_AWSIZE;
  wire m00_couplers_to_auto_pc_AWVALID;
  wire [11:0]m00_couplers_to_auto_pc_BID;
  wire m00_couplers_to_auto_pc_BREADY;
  wire [1:0]m00_couplers_to_auto_pc_BRESP;
  wire m00_couplers_to_auto_pc_BVALID;
  wire [31:0]m00_couplers_to_auto_pc_RDATA;
  wire [11:0]m00_couplers_to_auto_pc_RID;
  wire m00_couplers_to_auto_pc_RLAST;
  wire m00_couplers_to_auto_pc_RREADY;
  wire [1:0]m00_couplers_to_auto_pc_RRESP;
  wire m00_couplers_to_auto_pc_RVALID;
  wire [31:0]m00_couplers_to_auto_pc_WDATA;
  wire m00_couplers_to_auto_pc_WLAST;
  wire m00_couplers_to_auto_pc_WREADY;
  wire [3:0]m00_couplers_to_auto_pc_WSTRB;
  wire m00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[8:0] = auto_pc_to_m00_couplers_ARADDR[8:0];
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[8:0] = auto_pc_to_m00_couplers_AWADDR[8:0];
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN[0];
  assign S_AXI_arready = m00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = m00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = m00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign m00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign m00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
zynq_1_auto_pc_28 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_pc_BID),
        .s_axi_bready(m00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_pc_RID),
        .s_axi_rlast(m00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_pc_WVALID));
endmodule

module m01_couplers_imp_GDZ1S8
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [23:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [23:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [23:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [23:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [23:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [1:0]m01_couplers_to_m01_couplers_ARBURST;
  wire [3:0]m01_couplers_to_m01_couplers_ARCACHE;
  wire [11:0]m01_couplers_to_m01_couplers_ARID;
  wire [7:0]m01_couplers_to_m01_couplers_ARLEN;
  wire m01_couplers_to_m01_couplers_ARLOCK;
  wire [2:0]m01_couplers_to_m01_couplers_ARPROT;
  wire m01_couplers_to_m01_couplers_ARREADY;
  wire [2:0]m01_couplers_to_m01_couplers_ARSIZE;
  wire m01_couplers_to_m01_couplers_ARVALID;
  wire [23:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [1:0]m01_couplers_to_m01_couplers_AWBURST;
  wire [3:0]m01_couplers_to_m01_couplers_AWCACHE;
  wire [11:0]m01_couplers_to_m01_couplers_AWID;
  wire [7:0]m01_couplers_to_m01_couplers_AWLEN;
  wire m01_couplers_to_m01_couplers_AWLOCK;
  wire [2:0]m01_couplers_to_m01_couplers_AWPROT;
  wire m01_couplers_to_m01_couplers_AWREADY;
  wire [2:0]m01_couplers_to_m01_couplers_AWSIZE;
  wire m01_couplers_to_m01_couplers_AWVALID;
  wire [11:0]m01_couplers_to_m01_couplers_BID;
  wire m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [11:0]m01_couplers_to_m01_couplers_RID;
  wire m01_couplers_to_m01_couplers_RLAST;
  wire m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire m01_couplers_to_m01_couplers_WLAST;
  wire m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[23:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = m01_couplers_to_m01_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = m01_couplers_to_m01_couplers_ARCACHE;
  assign M_AXI_arid[11:0] = m01_couplers_to_m01_couplers_ARID;
  assign M_AXI_arlen[7:0] = m01_couplers_to_m01_couplers_ARLEN;
  assign M_AXI_arlock = m01_couplers_to_m01_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = m01_couplers_to_m01_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = m01_couplers_to_m01_couplers_ARSIZE;
  assign M_AXI_arvalid = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[23:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = m01_couplers_to_m01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = m01_couplers_to_m01_couplers_AWCACHE;
  assign M_AXI_awid[11:0] = m01_couplers_to_m01_couplers_AWID;
  assign M_AXI_awlen[7:0] = m01_couplers_to_m01_couplers_AWLEN;
  assign M_AXI_awlock = m01_couplers_to_m01_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = m01_couplers_to_m01_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = m01_couplers_to_m01_couplers_AWSIZE;
  assign M_AXI_awvalid = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wlast = m01_couplers_to_m01_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bid[11:0] = m01_couplers_to_m01_couplers_BID;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rid[11:0] = m01_couplers_to_m01_couplers_RID;
  assign S_AXI_rlast = m01_couplers_to_m01_couplers_RLAST;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[23:0];
  assign m01_couplers_to_m01_couplers_ARBURST = S_AXI_arburst[1:0];
  assign m01_couplers_to_m01_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign m01_couplers_to_m01_couplers_ARID = S_AXI_arid[11:0];
  assign m01_couplers_to_m01_couplers_ARLEN = S_AXI_arlen[7:0];
  assign m01_couplers_to_m01_couplers_ARLOCK = S_AXI_arlock;
  assign m01_couplers_to_m01_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_couplers_to_m01_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[23:0];
  assign m01_couplers_to_m01_couplers_AWBURST = S_AXI_awburst[1:0];
  assign m01_couplers_to_m01_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign m01_couplers_to_m01_couplers_AWID = S_AXI_awid[11:0];
  assign m01_couplers_to_m01_couplers_AWLEN = S_AXI_awlen[7:0];
  assign m01_couplers_to_m01_couplers_AWLOCK = S_AXI_awlock;
  assign m01_couplers_to_m01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_couplers_to_m01_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_couplers_BID = M_AXI_bid[11:0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RID = M_AXI_rid[11:0];
  assign m01_couplers_to_m01_couplers_RLAST = M_AXI_rlast;
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WLAST = S_AXI_wlast;
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid;
endmodule

module m02_couplers_imp_1LR7J63
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [11:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [11:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [11:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [1:0]m02_couplers_to_m02_couplers_ARBURST;
  wire [3:0]m02_couplers_to_m02_couplers_ARCACHE;
  wire [11:0]m02_couplers_to_m02_couplers_ARID;
  wire [7:0]m02_couplers_to_m02_couplers_ARLEN;
  wire m02_couplers_to_m02_couplers_ARLOCK;
  wire [2:0]m02_couplers_to_m02_couplers_ARPROT;
  wire m02_couplers_to_m02_couplers_ARREADY;
  wire [2:0]m02_couplers_to_m02_couplers_ARSIZE;
  wire m02_couplers_to_m02_couplers_ARVALID;
  wire [11:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [1:0]m02_couplers_to_m02_couplers_AWBURST;
  wire [3:0]m02_couplers_to_m02_couplers_AWCACHE;
  wire [11:0]m02_couplers_to_m02_couplers_AWID;
  wire [7:0]m02_couplers_to_m02_couplers_AWLEN;
  wire m02_couplers_to_m02_couplers_AWLOCK;
  wire [2:0]m02_couplers_to_m02_couplers_AWPROT;
  wire m02_couplers_to_m02_couplers_AWREADY;
  wire [2:0]m02_couplers_to_m02_couplers_AWSIZE;
  wire m02_couplers_to_m02_couplers_AWVALID;
  wire [11:0]m02_couplers_to_m02_couplers_BID;
  wire m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [11:0]m02_couplers_to_m02_couplers_RID;
  wire m02_couplers_to_m02_couplers_RLAST;
  wire m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire m02_couplers_to_m02_couplers_WLAST;
  wire m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = m02_couplers_to_m02_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = m02_couplers_to_m02_couplers_ARCACHE;
  assign M_AXI_arid[11:0] = m02_couplers_to_m02_couplers_ARID;
  assign M_AXI_arlen[7:0] = m02_couplers_to_m02_couplers_ARLEN;
  assign M_AXI_arlock = m02_couplers_to_m02_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = m02_couplers_to_m02_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = m02_couplers_to_m02_couplers_ARSIZE;
  assign M_AXI_arvalid = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = m02_couplers_to_m02_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = m02_couplers_to_m02_couplers_AWCACHE;
  assign M_AXI_awid[11:0] = m02_couplers_to_m02_couplers_AWID;
  assign M_AXI_awlen[7:0] = m02_couplers_to_m02_couplers_AWLEN;
  assign M_AXI_awlock = m02_couplers_to_m02_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = m02_couplers_to_m02_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = m02_couplers_to_m02_couplers_AWSIZE;
  assign M_AXI_awvalid = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wlast = m02_couplers_to_m02_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bid[11:0] = m02_couplers_to_m02_couplers_BID;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rid[11:0] = m02_couplers_to_m02_couplers_RID;
  assign S_AXI_rlast = m02_couplers_to_m02_couplers_RLAST;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[11:0];
  assign m02_couplers_to_m02_couplers_ARBURST = S_AXI_arburst[1:0];
  assign m02_couplers_to_m02_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign m02_couplers_to_m02_couplers_ARID = S_AXI_arid[11:0];
  assign m02_couplers_to_m02_couplers_ARLEN = S_AXI_arlen[7:0];
  assign m02_couplers_to_m02_couplers_ARLOCK = S_AXI_arlock;
  assign m02_couplers_to_m02_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_couplers_to_m02_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[11:0];
  assign m02_couplers_to_m02_couplers_AWBURST = S_AXI_awburst[1:0];
  assign m02_couplers_to_m02_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign m02_couplers_to_m02_couplers_AWID = S_AXI_awid[11:0];
  assign m02_couplers_to_m02_couplers_AWLEN = S_AXI_awlen[7:0];
  assign m02_couplers_to_m02_couplers_AWLOCK = S_AXI_awlock;
  assign m02_couplers_to_m02_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_couplers_to_m02_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_couplers_BID = M_AXI_bid[11:0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RID = M_AXI_rid[11:0];
  assign m02_couplers_to_m02_couplers_RLAST = M_AXI_rlast;
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WLAST = S_AXI_wlast;
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_DV8YS4
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire [0:0]S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [1:0]auto_pc_to_s00_couplers_ARBURST;
  wire [3:0]auto_pc_to_s00_couplers_ARCACHE;
  wire [11:0]auto_pc_to_s00_couplers_ARID;
  wire [7:0]auto_pc_to_s00_couplers_ARLEN;
  wire [0:0]auto_pc_to_s00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire [3:0]auto_pc_to_s00_couplers_ARQOS;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire [2:0]auto_pc_to_s00_couplers_ARSIZE;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [1:0]auto_pc_to_s00_couplers_AWBURST;
  wire [3:0]auto_pc_to_s00_couplers_AWCACHE;
  wire [11:0]auto_pc_to_s00_couplers_AWID;
  wire [7:0]auto_pc_to_s00_couplers_AWLEN;
  wire [0:0]auto_pc_to_s00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire [3:0]auto_pc_to_s00_couplers_AWQOS;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire [2:0]auto_pc_to_s00_couplers_AWSIZE;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire [11:0]auto_pc_to_s00_couplers_BID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire [11:0]auto_pc_to_s00_couplers_RID;
  wire auto_pc_to_s00_couplers_RLAST;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WLAST;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[11:0] = auto_pc_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = auto_pc_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_pc_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[11:0] = auto_pc_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = auto_pc_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[0] = auto_pc_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN[0];
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BID = M_AXI_bid[11:0];
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RID = M_AXI_rid[11:0];
  assign auto_pc_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
zynq_1_auto_pc_29 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_s00_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_s00_couplers_ARID),
        .m_axi_arlen(auto_pc_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_s00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_s00_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_s00_couplers_AWID),
        .m_axi_awlen(auto_pc_to_s00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_s00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_s00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_s00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_s00_couplers_BID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rid(auto_pc_to_s00_couplers_RID),
        .m_axi_rlast(auto_pc_to_s00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_s00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "zynq_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VERILOG,numBlks=15,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=5,maxHierDepth=0,da_axi4_cnt=4}" *) 
module zynq_1
   (BRAM_PORTB_addr,
    BRAM_PORTB_clk,
    BRAM_PORTB_din,
    BRAM_PORTB_dout,
    BRAM_PORTB_we,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    fclk_out_25,
    gpio,
    spi_clk,
    spi_out);
  input [10:0]BRAM_PORTB_addr;
  input BRAM_PORTB_clk;
  input [7:0]BRAM_PORTB_din;
  output [7:0]BRAM_PORTB_dout;
  input [0:0]BRAM_PORTB_we;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output fclk_out_25;
  output [31:0]gpio;
  output spi_clk;
  output spi_out;

  wire [10:0]BRAM_PORTB_1_ADDR;
  wire BRAM_PORTB_1_CLK;
  wire [7:0]BRAM_PORTB_1_DIN;
  wire [7:0]BRAM_PORTB_1_DOUT;
  wire [0:0]BRAM_PORTB_1_WE;
  wire GND_1;
  wire VCC_1;
  wire [11:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [31:0]axi_gpio_0_gpio_io_o;
  wire axi_quad_spi_0_io0_o;
  wire axi_quad_spi_0_sck_o;
  wire clk_wiz_0_clk_out1;
  wire [0:0]proc_sys_reset_1_interconnect_aresetn;
  wire [0:0]proc_sys_reset_1_peripheral_aresetn;
  wire [8:0]processing_system7_1_axi_periph_M00_AXI_ARADDR;
  wire processing_system7_1_axi_periph_M00_AXI_ARREADY;
  wire processing_system7_1_axi_periph_M00_AXI_ARVALID;
  wire [8:0]processing_system7_1_axi_periph_M00_AXI_AWADDR;
  wire processing_system7_1_axi_periph_M00_AXI_AWREADY;
  wire processing_system7_1_axi_periph_M00_AXI_AWVALID;
  wire processing_system7_1_axi_periph_M00_AXI_BREADY;
  wire [1:0]processing_system7_1_axi_periph_M00_AXI_BRESP;
  wire processing_system7_1_axi_periph_M00_AXI_BVALID;
  wire [31:0]processing_system7_1_axi_periph_M00_AXI_RDATA;
  wire processing_system7_1_axi_periph_M00_AXI_RREADY;
  wire [1:0]processing_system7_1_axi_periph_M00_AXI_RRESP;
  wire processing_system7_1_axi_periph_M00_AXI_RVALID;
  wire [31:0]processing_system7_1_axi_periph_M00_AXI_WDATA;
  wire processing_system7_1_axi_periph_M00_AXI_WREADY;
  wire [3:0]processing_system7_1_axi_periph_M00_AXI_WSTRB;
  wire processing_system7_1_axi_periph_M00_AXI_WVALID;
  wire [23:0]processing_system7_1_axi_periph_M01_AXI_ARADDR;
  wire [1:0]processing_system7_1_axi_periph_M01_AXI_ARBURST;
  wire [3:0]processing_system7_1_axi_periph_M01_AXI_ARCACHE;
  wire [11:0]processing_system7_1_axi_periph_M01_AXI_ARID;
  wire [7:0]processing_system7_1_axi_periph_M01_AXI_ARLEN;
  wire processing_system7_1_axi_periph_M01_AXI_ARLOCK;
  wire [2:0]processing_system7_1_axi_periph_M01_AXI_ARPROT;
  wire processing_system7_1_axi_periph_M01_AXI_ARREADY;
  wire [2:0]processing_system7_1_axi_periph_M01_AXI_ARSIZE;
  wire processing_system7_1_axi_periph_M01_AXI_ARVALID;
  wire [23:0]processing_system7_1_axi_periph_M01_AXI_AWADDR;
  wire [1:0]processing_system7_1_axi_periph_M01_AXI_AWBURST;
  wire [3:0]processing_system7_1_axi_periph_M01_AXI_AWCACHE;
  wire [11:0]processing_system7_1_axi_periph_M01_AXI_AWID;
  wire [7:0]processing_system7_1_axi_periph_M01_AXI_AWLEN;
  wire processing_system7_1_axi_periph_M01_AXI_AWLOCK;
  wire [2:0]processing_system7_1_axi_periph_M01_AXI_AWPROT;
  wire processing_system7_1_axi_periph_M01_AXI_AWREADY;
  wire [2:0]processing_system7_1_axi_periph_M01_AXI_AWSIZE;
  wire processing_system7_1_axi_periph_M01_AXI_AWVALID;
  wire [11:0]processing_system7_1_axi_periph_M01_AXI_BID;
  wire processing_system7_1_axi_periph_M01_AXI_BREADY;
  wire [1:0]processing_system7_1_axi_periph_M01_AXI_BRESP;
  wire processing_system7_1_axi_periph_M01_AXI_BVALID;
  wire [31:0]processing_system7_1_axi_periph_M01_AXI_RDATA;
  wire [11:0]processing_system7_1_axi_periph_M01_AXI_RID;
  wire processing_system7_1_axi_periph_M01_AXI_RLAST;
  wire processing_system7_1_axi_periph_M01_AXI_RREADY;
  wire [1:0]processing_system7_1_axi_periph_M01_AXI_RRESP;
  wire processing_system7_1_axi_periph_M01_AXI_RVALID;
  wire [31:0]processing_system7_1_axi_periph_M01_AXI_WDATA;
  wire processing_system7_1_axi_periph_M01_AXI_WLAST;
  wire processing_system7_1_axi_periph_M01_AXI_WREADY;
  wire [3:0]processing_system7_1_axi_periph_M01_AXI_WSTRB;
  wire processing_system7_1_axi_periph_M01_AXI_WVALID;
  wire [11:0]processing_system7_1_axi_periph_M02_AXI_ARADDR;
  wire [1:0]processing_system7_1_axi_periph_M02_AXI_ARBURST;
  wire [3:0]processing_system7_1_axi_periph_M02_AXI_ARCACHE;
  wire [11:0]processing_system7_1_axi_periph_M02_AXI_ARID;
  wire [7:0]processing_system7_1_axi_periph_M02_AXI_ARLEN;
  wire processing_system7_1_axi_periph_M02_AXI_ARLOCK;
  wire [2:0]processing_system7_1_axi_periph_M02_AXI_ARPROT;
  wire processing_system7_1_axi_periph_M02_AXI_ARREADY;
  wire [2:0]processing_system7_1_axi_periph_M02_AXI_ARSIZE;
  wire processing_system7_1_axi_periph_M02_AXI_ARVALID;
  wire [11:0]processing_system7_1_axi_periph_M02_AXI_AWADDR;
  wire [1:0]processing_system7_1_axi_periph_M02_AXI_AWBURST;
  wire [3:0]processing_system7_1_axi_periph_M02_AXI_AWCACHE;
  wire [11:0]processing_system7_1_axi_periph_M02_AXI_AWID;
  wire [7:0]processing_system7_1_axi_periph_M02_AXI_AWLEN;
  wire processing_system7_1_axi_periph_M02_AXI_AWLOCK;
  wire [2:0]processing_system7_1_axi_periph_M02_AXI_AWPROT;
  wire processing_system7_1_axi_periph_M02_AXI_AWREADY;
  wire [2:0]processing_system7_1_axi_periph_M02_AXI_AWSIZE;
  wire processing_system7_1_axi_periph_M02_AXI_AWVALID;
  wire [11:0]processing_system7_1_axi_periph_M02_AXI_BID;
  wire processing_system7_1_axi_periph_M02_AXI_BREADY;
  wire [1:0]processing_system7_1_axi_periph_M02_AXI_BRESP;
  wire processing_system7_1_axi_periph_M02_AXI_BVALID;
  wire [31:0]processing_system7_1_axi_periph_M02_AXI_RDATA;
  wire [11:0]processing_system7_1_axi_periph_M02_AXI_RID;
  wire processing_system7_1_axi_periph_M02_AXI_RLAST;
  wire processing_system7_1_axi_periph_M02_AXI_RREADY;
  wire [1:0]processing_system7_1_axi_periph_M02_AXI_RRESP;
  wire processing_system7_1_axi_periph_M02_AXI_RVALID;
  wire [31:0]processing_system7_1_axi_periph_M02_AXI_WDATA;
  wire processing_system7_1_axi_periph_M02_AXI_WLAST;
  wire processing_system7_1_axi_periph_M02_AXI_WREADY;
  wire [3:0]processing_system7_1_axi_periph_M02_AXI_WSTRB;
  wire processing_system7_1_axi_periph_M02_AXI_WVALID;
  wire [14:0]processing_system7_1_ddr_ADDR;
  wire [2:0]processing_system7_1_ddr_BA;
  wire processing_system7_1_ddr_CAS_N;
  wire processing_system7_1_ddr_CKE;
  wire processing_system7_1_ddr_CK_N;
  wire processing_system7_1_ddr_CK_P;
  wire processing_system7_1_ddr_CS_N;
  wire [3:0]processing_system7_1_ddr_DM;
  wire [31:0]processing_system7_1_ddr_DQ;
  wire [3:0]processing_system7_1_ddr_DQS_N;
  wire [3:0]processing_system7_1_ddr_DQS_P;
  wire processing_system7_1_ddr_ODT;
  wire processing_system7_1_ddr_RAS_N;
  wire processing_system7_1_ddr_RESET_N;
  wire processing_system7_1_ddr_WE_N;
  wire processing_system7_1_fclk_clk0;
  wire processing_system7_1_fclk_reset0_n;
  wire processing_system7_1_fixed_io_DDR_VRN;
  wire processing_system7_1_fixed_io_DDR_VRP;
  wire [53:0]processing_system7_1_fixed_io_MIO;
  wire processing_system7_1_fixed_io_PS_CLK;
  wire processing_system7_1_fixed_io_PS_PORB;
  wire processing_system7_1_fixed_io_PS_SRSTB;
  wire [31:0]processing_system7_1_m_axi_gp0_ARADDR;
  wire [1:0]processing_system7_1_m_axi_gp0_ARBURST;
  wire [3:0]processing_system7_1_m_axi_gp0_ARCACHE;
  wire [11:0]processing_system7_1_m_axi_gp0_ARID;
  wire [3:0]processing_system7_1_m_axi_gp0_ARLEN;
  wire [1:0]processing_system7_1_m_axi_gp0_ARLOCK;
  wire [2:0]processing_system7_1_m_axi_gp0_ARPROT;
  wire [3:0]processing_system7_1_m_axi_gp0_ARQOS;
  wire processing_system7_1_m_axi_gp0_ARREADY;
  wire [2:0]processing_system7_1_m_axi_gp0_ARSIZE;
  wire processing_system7_1_m_axi_gp0_ARVALID;
  wire [31:0]processing_system7_1_m_axi_gp0_AWADDR;
  wire [1:0]processing_system7_1_m_axi_gp0_AWBURST;
  wire [3:0]processing_system7_1_m_axi_gp0_AWCACHE;
  wire [11:0]processing_system7_1_m_axi_gp0_AWID;
  wire [3:0]processing_system7_1_m_axi_gp0_AWLEN;
  wire [1:0]processing_system7_1_m_axi_gp0_AWLOCK;
  wire [2:0]processing_system7_1_m_axi_gp0_AWPROT;
  wire [3:0]processing_system7_1_m_axi_gp0_AWQOS;
  wire processing_system7_1_m_axi_gp0_AWREADY;
  wire [2:0]processing_system7_1_m_axi_gp0_AWSIZE;
  wire processing_system7_1_m_axi_gp0_AWVALID;
  wire [11:0]processing_system7_1_m_axi_gp0_BID;
  wire processing_system7_1_m_axi_gp0_BREADY;
  wire [1:0]processing_system7_1_m_axi_gp0_BRESP;
  wire processing_system7_1_m_axi_gp0_BVALID;
  wire [31:0]processing_system7_1_m_axi_gp0_RDATA;
  wire [11:0]processing_system7_1_m_axi_gp0_RID;
  wire processing_system7_1_m_axi_gp0_RLAST;
  wire processing_system7_1_m_axi_gp0_RREADY;
  wire [1:0]processing_system7_1_m_axi_gp0_RRESP;
  wire processing_system7_1_m_axi_gp0_RVALID;
  wire [31:0]processing_system7_1_m_axi_gp0_WDATA;
  wire [11:0]processing_system7_1_m_axi_gp0_WID;
  wire processing_system7_1_m_axi_gp0_WLAST;
  wire processing_system7_1_m_axi_gp0_WREADY;
  wire [3:0]processing_system7_1_m_axi_gp0_WSTRB;
  wire processing_system7_1_m_axi_gp0_WVALID;

  assign BRAM_PORTB_1_ADDR = BRAM_PORTB_addr[10:0];
  assign BRAM_PORTB_1_CLK = BRAM_PORTB_clk;
  assign BRAM_PORTB_1_DIN = BRAM_PORTB_din[7:0];
  assign BRAM_PORTB_1_WE = BRAM_PORTB_we[0];
  assign BRAM_PORTB_dout[7:0] = BRAM_PORTB_1_DOUT;
  assign fclk_out_25 = clk_wiz_0_clk_out1;
  assign gpio[31:0] = axi_gpio_0_gpio_io_o;
  assign spi_clk = axi_quad_spi_0_sck_o;
  assign spi_out = axi_quad_spi_0_io0_o;
GND GND
       (.G(GND_1));
VCC VCC
       (.P(VCC_1));
(* BMM_INFO_ADDRESS_SPACE = "byte  0x40000000 32 >  zynq_1 blk_mem_gen_0" *) 
   (* KEEP_HIERARCHY = "yes" *) 
   zynq_1_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(processing_system7_1_fclk_clk0),
        .s_axi_araddr(processing_system7_1_axi_periph_M02_AXI_ARADDR),
        .s_axi_arburst(processing_system7_1_axi_periph_M02_AXI_ARBURST),
        .s_axi_arcache(processing_system7_1_axi_periph_M02_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .s_axi_arid(processing_system7_1_axi_periph_M02_AXI_ARID),
        .s_axi_arlen(processing_system7_1_axi_periph_M02_AXI_ARLEN),
        .s_axi_arlock(processing_system7_1_axi_periph_M02_AXI_ARLOCK),
        .s_axi_arprot(processing_system7_1_axi_periph_M02_AXI_ARPROT),
        .s_axi_arready(processing_system7_1_axi_periph_M02_AXI_ARREADY),
        .s_axi_arsize(processing_system7_1_axi_periph_M02_AXI_ARSIZE),
        .s_axi_arvalid(processing_system7_1_axi_periph_M02_AXI_ARVALID),
        .s_axi_awaddr(processing_system7_1_axi_periph_M02_AXI_AWADDR),
        .s_axi_awburst(processing_system7_1_axi_periph_M02_AXI_AWBURST),
        .s_axi_awcache(processing_system7_1_axi_periph_M02_AXI_AWCACHE),
        .s_axi_awid(processing_system7_1_axi_periph_M02_AXI_AWID),
        .s_axi_awlen(processing_system7_1_axi_periph_M02_AXI_AWLEN),
        .s_axi_awlock(processing_system7_1_axi_periph_M02_AXI_AWLOCK),
        .s_axi_awprot(processing_system7_1_axi_periph_M02_AXI_AWPROT),
        .s_axi_awready(processing_system7_1_axi_periph_M02_AXI_AWREADY),
        .s_axi_awsize(processing_system7_1_axi_periph_M02_AXI_AWSIZE),
        .s_axi_awvalid(processing_system7_1_axi_periph_M02_AXI_AWVALID),
        .s_axi_bid(processing_system7_1_axi_periph_M02_AXI_BID),
        .s_axi_bready(processing_system7_1_axi_periph_M02_AXI_BREADY),
        .s_axi_bresp(processing_system7_1_axi_periph_M02_AXI_BRESP),
        .s_axi_bvalid(processing_system7_1_axi_periph_M02_AXI_BVALID),
        .s_axi_rdata(processing_system7_1_axi_periph_M02_AXI_RDATA),
        .s_axi_rid(processing_system7_1_axi_periph_M02_AXI_RID),
        .s_axi_rlast(processing_system7_1_axi_periph_M02_AXI_RLAST),
        .s_axi_rready(processing_system7_1_axi_periph_M02_AXI_RREADY),
        .s_axi_rresp(processing_system7_1_axi_periph_M02_AXI_RRESP),
        .s_axi_rvalid(processing_system7_1_axi_periph_M02_AXI_RVALID),
        .s_axi_wdata(processing_system7_1_axi_periph_M02_AXI_WDATA),
        .s_axi_wlast(processing_system7_1_axi_periph_M02_AXI_WLAST),
        .s_axi_wready(processing_system7_1_axi_periph_M02_AXI_WREADY),
        .s_axi_wstrb(processing_system7_1_axi_periph_M02_AXI_WSTRB),
        .s_axi_wvalid(processing_system7_1_axi_periph_M02_AXI_WVALID));
zynq_1_axi_gpio_0_0 axi_gpio_0
       (.gpio_io_i({GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1,GND_1}),
        .gpio_io_o(axi_gpio_0_gpio_io_o),
        .s_axi_aclk(processing_system7_1_fclk_clk0),
        .s_axi_araddr(processing_system7_1_axi_periph_M00_AXI_ARADDR),
        .s_axi_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .s_axi_arready(processing_system7_1_axi_periph_M00_AXI_ARREADY),
        .s_axi_arvalid(processing_system7_1_axi_periph_M00_AXI_ARVALID),
        .s_axi_awaddr(processing_system7_1_axi_periph_M00_AXI_AWADDR),
        .s_axi_awready(processing_system7_1_axi_periph_M00_AXI_AWREADY),
        .s_axi_awvalid(processing_system7_1_axi_periph_M00_AXI_AWVALID),
        .s_axi_bready(processing_system7_1_axi_periph_M00_AXI_BREADY),
        .s_axi_bresp(processing_system7_1_axi_periph_M00_AXI_BRESP),
        .s_axi_bvalid(processing_system7_1_axi_periph_M00_AXI_BVALID),
        .s_axi_rdata(processing_system7_1_axi_periph_M00_AXI_RDATA),
        .s_axi_rready(processing_system7_1_axi_periph_M00_AXI_RREADY),
        .s_axi_rresp(processing_system7_1_axi_periph_M00_AXI_RRESP),
        .s_axi_rvalid(processing_system7_1_axi_periph_M00_AXI_RVALID),
        .s_axi_wdata(processing_system7_1_axi_periph_M00_AXI_WDATA),
        .s_axi_wready(processing_system7_1_axi_periph_M00_AXI_WREADY),
        .s_axi_wstrb(processing_system7_1_axi_periph_M00_AXI_WSTRB),
        .s_axi_wvalid(processing_system7_1_axi_periph_M00_AXI_WVALID));
zynq_1_axi_quad_spi_0_0 axi_quad_spi_0
       (.ext_spi_clk(processing_system7_1_fclk_clk0),
        .io0_i(GND_1),
        .io0_o(axi_quad_spi_0_io0_o),
        .io1_i(GND_1),
        .s_axi4_aclk(processing_system7_1_fclk_clk0),
        .s_axi4_araddr(processing_system7_1_axi_periph_M01_AXI_ARADDR),
        .s_axi4_arburst(processing_system7_1_axi_periph_M01_AXI_ARBURST),
        .s_axi4_arcache(processing_system7_1_axi_periph_M01_AXI_ARCACHE),
        .s_axi4_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .s_axi4_arid(processing_system7_1_axi_periph_M01_AXI_ARID),
        .s_axi4_arlen(processing_system7_1_axi_periph_M01_AXI_ARLEN),
        .s_axi4_arlock(processing_system7_1_axi_periph_M01_AXI_ARLOCK),
        .s_axi4_arprot(processing_system7_1_axi_periph_M01_AXI_ARPROT),
        .s_axi4_arready(processing_system7_1_axi_periph_M01_AXI_ARREADY),
        .s_axi4_arsize(processing_system7_1_axi_periph_M01_AXI_ARSIZE),
        .s_axi4_arvalid(processing_system7_1_axi_periph_M01_AXI_ARVALID),
        .s_axi4_awaddr(processing_system7_1_axi_periph_M01_AXI_AWADDR),
        .s_axi4_awburst(processing_system7_1_axi_periph_M01_AXI_AWBURST),
        .s_axi4_awcache(processing_system7_1_axi_periph_M01_AXI_AWCACHE),
        .s_axi4_awid(processing_system7_1_axi_periph_M01_AXI_AWID),
        .s_axi4_awlen(processing_system7_1_axi_periph_M01_AXI_AWLEN),
        .s_axi4_awlock(processing_system7_1_axi_periph_M01_AXI_AWLOCK),
        .s_axi4_awprot(processing_system7_1_axi_periph_M01_AXI_AWPROT),
        .s_axi4_awready(processing_system7_1_axi_periph_M01_AXI_AWREADY),
        .s_axi4_awsize(processing_system7_1_axi_periph_M01_AXI_AWSIZE),
        .s_axi4_awvalid(processing_system7_1_axi_periph_M01_AXI_AWVALID),
        .s_axi4_bid(processing_system7_1_axi_periph_M01_AXI_BID),
        .s_axi4_bready(processing_system7_1_axi_periph_M01_AXI_BREADY),
        .s_axi4_bresp(processing_system7_1_axi_periph_M01_AXI_BRESP),
        .s_axi4_bvalid(processing_system7_1_axi_periph_M01_AXI_BVALID),
        .s_axi4_rdata(processing_system7_1_axi_periph_M01_AXI_RDATA),
        .s_axi4_rid(processing_system7_1_axi_periph_M01_AXI_RID),
        .s_axi4_rlast(processing_system7_1_axi_periph_M01_AXI_RLAST),
        .s_axi4_rready(processing_system7_1_axi_periph_M01_AXI_RREADY),
        .s_axi4_rresp(processing_system7_1_axi_periph_M01_AXI_RRESP),
        .s_axi4_rvalid(processing_system7_1_axi_periph_M01_AXI_RVALID),
        .s_axi4_wdata(processing_system7_1_axi_periph_M01_AXI_WDATA),
        .s_axi4_wlast(processing_system7_1_axi_periph_M01_AXI_WLAST),
        .s_axi4_wready(processing_system7_1_axi_periph_M01_AXI_WREADY),
        .s_axi4_wstrb(processing_system7_1_axi_periph_M01_AXI_WSTRB),
        .s_axi4_wvalid(processing_system7_1_axi_periph_M01_AXI_WVALID),
        .sck_i(GND_1),
        .sck_o(axi_quad_spi_0_sck_o),
        .ss_i(GND_1));
zynq_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(axi_bram_ctrl_0_BRAM_PORTA_ADDR[8:0]),
        .addrb(BRAM_PORTB_1_ADDR),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(BRAM_PORTB_1_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb(BRAM_PORTB_1_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(BRAM_PORTB_1_DOUT),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE[0]),
        .web(BRAM_PORTB_1_WE));
zynq_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(processing_system7_1_fclk_clk0),
        .clk_out1(clk_wiz_0_clk_out1));
zynq_1_proc_sys_reset_1_0 proc_sys_reset_1
       (.aux_reset_in(VCC_1),
        .dcm_locked(VCC_1),
        .ext_reset_in(processing_system7_1_fclk_reset0_n),
        .interconnect_aresetn(proc_sys_reset_1_interconnect_aresetn),
        .mb_debug_sys_rst(GND_1),
        .peripheral_aresetn(proc_sys_reset_1_peripheral_aresetn),
        .slowest_sync_clk(processing_system7_1_fclk_clk0));
(* BMM_INFO_PROCESSOR = "ARM > zynq_1 axi_bram_ctrl_0" *) 
   (* KEEP_HIERARCHY = "yes" *) 
   zynq_1_processing_system7_1_0 processing_system7_1
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_1_fclk_clk0),
        .FCLK_RESET0_N(processing_system7_1_fclk_reset0_n),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_1_fclk_clk0),
        .M_AXI_GP0_ARADDR(processing_system7_1_m_axi_gp0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_1_m_axi_gp0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_1_m_axi_gp0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_1_m_axi_gp0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_1_m_axi_gp0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_1_m_axi_gp0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_1_m_axi_gp0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_1_m_axi_gp0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_1_m_axi_gp0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_1_m_axi_gp0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_1_m_axi_gp0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_1_m_axi_gp0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_1_m_axi_gp0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_1_m_axi_gp0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_1_m_axi_gp0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_1_m_axi_gp0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_1_m_axi_gp0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_1_m_axi_gp0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_1_m_axi_gp0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_1_m_axi_gp0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_1_m_axi_gp0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_1_m_axi_gp0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_1_m_axi_gp0_BID),
        .M_AXI_GP0_BREADY(processing_system7_1_m_axi_gp0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_1_m_axi_gp0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_1_m_axi_gp0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_1_m_axi_gp0_RDATA),
        .M_AXI_GP0_RID(processing_system7_1_m_axi_gp0_RID),
        .M_AXI_GP0_RLAST(processing_system7_1_m_axi_gp0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_1_m_axi_gp0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_1_m_axi_gp0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_1_m_axi_gp0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_1_m_axi_gp0_WDATA),
        .M_AXI_GP0_WID(processing_system7_1_m_axi_gp0_WID),
        .M_AXI_GP0_WLAST(processing_system7_1_m_axi_gp0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_1_m_axi_gp0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_1_m_axi_gp0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_1_m_axi_gp0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .TTC0_CLK0_IN(GND_1),
        .TTC0_CLK1_IN(GND_1),
        .TTC0_CLK2_IN(GND_1));
zynq_1_processing_system7_1_axi_periph_0 processing_system7_1_axi_periph
       (.ACLK(processing_system7_1_fclk_clk0),
        .ARESETN(proc_sys_reset_1_interconnect_aresetn),
        .M00_ACLK(processing_system7_1_fclk_clk0),
        .M00_ARESETN(proc_sys_reset_1_peripheral_aresetn),
        .M00_AXI_araddr(processing_system7_1_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(processing_system7_1_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(processing_system7_1_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(processing_system7_1_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(processing_system7_1_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(processing_system7_1_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(processing_system7_1_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(processing_system7_1_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(processing_system7_1_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(processing_system7_1_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(processing_system7_1_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(processing_system7_1_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(processing_system7_1_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(processing_system7_1_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(processing_system7_1_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(processing_system7_1_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(processing_system7_1_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(processing_system7_1_fclk_clk0),
        .M01_ARESETN(proc_sys_reset_1_peripheral_aresetn),
        .M01_AXI_araddr(processing_system7_1_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arburst(processing_system7_1_axi_periph_M01_AXI_ARBURST),
        .M01_AXI_arcache(processing_system7_1_axi_periph_M01_AXI_ARCACHE),
        .M01_AXI_arid(processing_system7_1_axi_periph_M01_AXI_ARID),
        .M01_AXI_arlen(processing_system7_1_axi_periph_M01_AXI_ARLEN),
        .M01_AXI_arlock(processing_system7_1_axi_periph_M01_AXI_ARLOCK),
        .M01_AXI_arprot(processing_system7_1_axi_periph_M01_AXI_ARPROT),
        .M01_AXI_arready(processing_system7_1_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arsize(processing_system7_1_axi_periph_M01_AXI_ARSIZE),
        .M01_AXI_arvalid(processing_system7_1_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(processing_system7_1_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awburst(processing_system7_1_axi_periph_M01_AXI_AWBURST),
        .M01_AXI_awcache(processing_system7_1_axi_periph_M01_AXI_AWCACHE),
        .M01_AXI_awid(processing_system7_1_axi_periph_M01_AXI_AWID),
        .M01_AXI_awlen(processing_system7_1_axi_periph_M01_AXI_AWLEN),
        .M01_AXI_awlock(processing_system7_1_axi_periph_M01_AXI_AWLOCK),
        .M01_AXI_awprot(processing_system7_1_axi_periph_M01_AXI_AWPROT),
        .M01_AXI_awready(processing_system7_1_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awsize(processing_system7_1_axi_periph_M01_AXI_AWSIZE),
        .M01_AXI_awvalid(processing_system7_1_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bid(processing_system7_1_axi_periph_M01_AXI_BID),
        .M01_AXI_bready(processing_system7_1_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(processing_system7_1_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(processing_system7_1_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(processing_system7_1_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rid(processing_system7_1_axi_periph_M01_AXI_RID),
        .M01_AXI_rlast(processing_system7_1_axi_periph_M01_AXI_RLAST),
        .M01_AXI_rready(processing_system7_1_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(processing_system7_1_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(processing_system7_1_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(processing_system7_1_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wlast(processing_system7_1_axi_periph_M01_AXI_WLAST),
        .M01_AXI_wready(processing_system7_1_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wstrb(processing_system7_1_axi_periph_M01_AXI_WSTRB),
        .M01_AXI_wvalid(processing_system7_1_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(processing_system7_1_fclk_clk0),
        .M02_ARESETN(proc_sys_reset_1_peripheral_aresetn),
        .M02_AXI_araddr(processing_system7_1_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arburst(processing_system7_1_axi_periph_M02_AXI_ARBURST),
        .M02_AXI_arcache(processing_system7_1_axi_periph_M02_AXI_ARCACHE),
        .M02_AXI_arid(processing_system7_1_axi_periph_M02_AXI_ARID),
        .M02_AXI_arlen(processing_system7_1_axi_periph_M02_AXI_ARLEN),
        .M02_AXI_arlock(processing_system7_1_axi_periph_M02_AXI_ARLOCK),
        .M02_AXI_arprot(processing_system7_1_axi_periph_M02_AXI_ARPROT),
        .M02_AXI_arready(processing_system7_1_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arsize(processing_system7_1_axi_periph_M02_AXI_ARSIZE),
        .M02_AXI_arvalid(processing_system7_1_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(processing_system7_1_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awburst(processing_system7_1_axi_periph_M02_AXI_AWBURST),
        .M02_AXI_awcache(processing_system7_1_axi_periph_M02_AXI_AWCACHE),
        .M02_AXI_awid(processing_system7_1_axi_periph_M02_AXI_AWID),
        .M02_AXI_awlen(processing_system7_1_axi_periph_M02_AXI_AWLEN),
        .M02_AXI_awlock(processing_system7_1_axi_periph_M02_AXI_AWLOCK),
        .M02_AXI_awprot(processing_system7_1_axi_periph_M02_AXI_AWPROT),
        .M02_AXI_awready(processing_system7_1_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awsize(processing_system7_1_axi_periph_M02_AXI_AWSIZE),
        .M02_AXI_awvalid(processing_system7_1_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bid(processing_system7_1_axi_periph_M02_AXI_BID),
        .M02_AXI_bready(processing_system7_1_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(processing_system7_1_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(processing_system7_1_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(processing_system7_1_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rid(processing_system7_1_axi_periph_M02_AXI_RID),
        .M02_AXI_rlast(processing_system7_1_axi_periph_M02_AXI_RLAST),
        .M02_AXI_rready(processing_system7_1_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(processing_system7_1_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(processing_system7_1_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(processing_system7_1_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wlast(processing_system7_1_axi_periph_M02_AXI_WLAST),
        .M02_AXI_wready(processing_system7_1_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wstrb(processing_system7_1_axi_periph_M02_AXI_WSTRB),
        .M02_AXI_wvalid(processing_system7_1_axi_periph_M02_AXI_WVALID),
        .S00_ACLK(processing_system7_1_fclk_clk0),
        .S00_ARESETN(proc_sys_reset_1_peripheral_aresetn),
        .S00_AXI_araddr(processing_system7_1_m_axi_gp0_ARADDR),
        .S00_AXI_arburst(processing_system7_1_m_axi_gp0_ARBURST),
        .S00_AXI_arcache(processing_system7_1_m_axi_gp0_ARCACHE),
        .S00_AXI_arid(processing_system7_1_m_axi_gp0_ARID),
        .S00_AXI_arlen(processing_system7_1_m_axi_gp0_ARLEN),
        .S00_AXI_arlock(processing_system7_1_m_axi_gp0_ARLOCK),
        .S00_AXI_arprot(processing_system7_1_m_axi_gp0_ARPROT),
        .S00_AXI_arqos(processing_system7_1_m_axi_gp0_ARQOS),
        .S00_AXI_arready(processing_system7_1_m_axi_gp0_ARREADY),
        .S00_AXI_arsize(processing_system7_1_m_axi_gp0_ARSIZE),
        .S00_AXI_arvalid(processing_system7_1_m_axi_gp0_ARVALID),
        .S00_AXI_awaddr(processing_system7_1_m_axi_gp0_AWADDR),
        .S00_AXI_awburst(processing_system7_1_m_axi_gp0_AWBURST),
        .S00_AXI_awcache(processing_system7_1_m_axi_gp0_AWCACHE),
        .S00_AXI_awid(processing_system7_1_m_axi_gp0_AWID),
        .S00_AXI_awlen(processing_system7_1_m_axi_gp0_AWLEN),
        .S00_AXI_awlock(processing_system7_1_m_axi_gp0_AWLOCK),
        .S00_AXI_awprot(processing_system7_1_m_axi_gp0_AWPROT),
        .S00_AXI_awqos(processing_system7_1_m_axi_gp0_AWQOS),
        .S00_AXI_awready(processing_system7_1_m_axi_gp0_AWREADY),
        .S00_AXI_awsize(processing_system7_1_m_axi_gp0_AWSIZE),
        .S00_AXI_awvalid(processing_system7_1_m_axi_gp0_AWVALID),
        .S00_AXI_bid(processing_system7_1_m_axi_gp0_BID),
        .S00_AXI_bready(processing_system7_1_m_axi_gp0_BREADY),
        .S00_AXI_bresp(processing_system7_1_m_axi_gp0_BRESP),
        .S00_AXI_bvalid(processing_system7_1_m_axi_gp0_BVALID),
        .S00_AXI_rdata(processing_system7_1_m_axi_gp0_RDATA),
        .S00_AXI_rid(processing_system7_1_m_axi_gp0_RID),
        .S00_AXI_rlast(processing_system7_1_m_axi_gp0_RLAST),
        .S00_AXI_rready(processing_system7_1_m_axi_gp0_RREADY),
        .S00_AXI_rresp(processing_system7_1_m_axi_gp0_RRESP),
        .S00_AXI_rvalid(processing_system7_1_m_axi_gp0_RVALID),
        .S00_AXI_wdata(processing_system7_1_m_axi_gp0_WDATA),
        .S00_AXI_wid(processing_system7_1_m_axi_gp0_WID),
        .S00_AXI_wlast(processing_system7_1_m_axi_gp0_WLAST),
        .S00_AXI_wready(processing_system7_1_m_axi_gp0_WREADY),
        .S00_AXI_wstrb(processing_system7_1_m_axi_gp0_WSTRB),
        .S00_AXI_wvalid(processing_system7_1_m_axi_gp0_WVALID));
endmodule

module zynq_1_processing_system7_1_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arburst,
    M01_AXI_arcache,
    M01_AXI_arid,
    M01_AXI_arlen,
    M01_AXI_arlock,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arsize,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awburst,
    M01_AXI_awcache,
    M01_AXI_awid,
    M01_AXI_awlen,
    M01_AXI_awlock,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awsize,
    M01_AXI_awvalid,
    M01_AXI_bid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rid,
    M01_AXI_rlast,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wlast,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arburst,
    M02_AXI_arcache,
    M02_AXI_arid,
    M02_AXI_arlen,
    M02_AXI_arlock,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arsize,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awburst,
    M02_AXI_awcache,
    M02_AXI_awid,
    M02_AXI_awlen,
    M02_AXI_awlock,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awsize,
    M02_AXI_awvalid,
    M02_AXI_bid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rid,
    M02_AXI_rlast,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wlast,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input [0:0]ARESETN;
  input M00_ACLK;
  input [0:0]M00_ARESETN;
  output [8:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [8:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input [0:0]M01_ARESETN;
  output [23:0]M01_AXI_araddr;
  output [1:0]M01_AXI_arburst;
  output [3:0]M01_AXI_arcache;
  output [11:0]M01_AXI_arid;
  output [7:0]M01_AXI_arlen;
  output M01_AXI_arlock;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output [2:0]M01_AXI_arsize;
  output M01_AXI_arvalid;
  output [23:0]M01_AXI_awaddr;
  output [1:0]M01_AXI_awburst;
  output [3:0]M01_AXI_awcache;
  output [11:0]M01_AXI_awid;
  output [7:0]M01_AXI_awlen;
  output M01_AXI_awlock;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output [2:0]M01_AXI_awsize;
  output M01_AXI_awvalid;
  input [11:0]M01_AXI_bid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  input [11:0]M01_AXI_rid;
  input M01_AXI_rlast;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  output M01_AXI_wlast;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input [0:0]M02_ARESETN;
  output [11:0]M02_AXI_araddr;
  output [1:0]M02_AXI_arburst;
  output [3:0]M02_AXI_arcache;
  output [11:0]M02_AXI_arid;
  output [7:0]M02_AXI_arlen;
  output M02_AXI_arlock;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output [2:0]M02_AXI_arsize;
  output M02_AXI_arvalid;
  output [11:0]M02_AXI_awaddr;
  output [1:0]M02_AXI_awburst;
  output [3:0]M02_AXI_awcache;
  output [11:0]M02_AXI_awid;
  output [7:0]M02_AXI_awlen;
  output M02_AXI_awlock;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output [2:0]M02_AXI_awsize;
  output M02_AXI_awvalid;
  input [11:0]M02_AXI_bid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  input [11:0]M02_AXI_rid;
  input M02_AXI_rlast;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  output M02_AXI_wlast;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input S00_ACLK;
  input [0:0]S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire [0:0]M00_ARESETN_1;
  wire M01_ACLK_1;
  wire [0:0]M01_ARESETN_1;
  wire M02_ACLK_1;
  wire [0:0]M02_ARESETN_1;
  wire S00_ACLK_1;
  wire [0:0]S00_ARESETN_1;
  wire [8:0]m00_couplers_to_processing_system7_1_axi_periph_ARADDR;
  wire m00_couplers_to_processing_system7_1_axi_periph_ARREADY;
  wire m00_couplers_to_processing_system7_1_axi_periph_ARVALID;
  wire [8:0]m00_couplers_to_processing_system7_1_axi_periph_AWADDR;
  wire m00_couplers_to_processing_system7_1_axi_periph_AWREADY;
  wire m00_couplers_to_processing_system7_1_axi_periph_AWVALID;
  wire m00_couplers_to_processing_system7_1_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_processing_system7_1_axi_periph_BRESP;
  wire m00_couplers_to_processing_system7_1_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_processing_system7_1_axi_periph_RDATA;
  wire m00_couplers_to_processing_system7_1_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_processing_system7_1_axi_periph_RRESP;
  wire m00_couplers_to_processing_system7_1_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_processing_system7_1_axi_periph_WDATA;
  wire m00_couplers_to_processing_system7_1_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_processing_system7_1_axi_periph_WSTRB;
  wire m00_couplers_to_processing_system7_1_axi_periph_WVALID;
  wire [23:0]m01_couplers_to_processing_system7_1_axi_periph_ARADDR;
  wire [1:0]m01_couplers_to_processing_system7_1_axi_periph_ARBURST;
  wire [3:0]m01_couplers_to_processing_system7_1_axi_periph_ARCACHE;
  wire [11:0]m01_couplers_to_processing_system7_1_axi_periph_ARID;
  wire [7:0]m01_couplers_to_processing_system7_1_axi_periph_ARLEN;
  wire m01_couplers_to_processing_system7_1_axi_periph_ARLOCK;
  wire [2:0]m01_couplers_to_processing_system7_1_axi_periph_ARPROT;
  wire m01_couplers_to_processing_system7_1_axi_periph_ARREADY;
  wire [2:0]m01_couplers_to_processing_system7_1_axi_periph_ARSIZE;
  wire m01_couplers_to_processing_system7_1_axi_periph_ARVALID;
  wire [23:0]m01_couplers_to_processing_system7_1_axi_periph_AWADDR;
  wire [1:0]m01_couplers_to_processing_system7_1_axi_periph_AWBURST;
  wire [3:0]m01_couplers_to_processing_system7_1_axi_periph_AWCACHE;
  wire [11:0]m01_couplers_to_processing_system7_1_axi_periph_AWID;
  wire [7:0]m01_couplers_to_processing_system7_1_axi_periph_AWLEN;
  wire m01_couplers_to_processing_system7_1_axi_periph_AWLOCK;
  wire [2:0]m01_couplers_to_processing_system7_1_axi_periph_AWPROT;
  wire m01_couplers_to_processing_system7_1_axi_periph_AWREADY;
  wire [2:0]m01_couplers_to_processing_system7_1_axi_periph_AWSIZE;
  wire m01_couplers_to_processing_system7_1_axi_periph_AWVALID;
  wire [11:0]m01_couplers_to_processing_system7_1_axi_periph_BID;
  wire m01_couplers_to_processing_system7_1_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_processing_system7_1_axi_periph_BRESP;
  wire m01_couplers_to_processing_system7_1_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_processing_system7_1_axi_periph_RDATA;
  wire [11:0]m01_couplers_to_processing_system7_1_axi_periph_RID;
  wire m01_couplers_to_processing_system7_1_axi_periph_RLAST;
  wire m01_couplers_to_processing_system7_1_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_processing_system7_1_axi_periph_RRESP;
  wire m01_couplers_to_processing_system7_1_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_processing_system7_1_axi_periph_WDATA;
  wire m01_couplers_to_processing_system7_1_axi_periph_WLAST;
  wire m01_couplers_to_processing_system7_1_axi_periph_WREADY;
  wire [3:0]m01_couplers_to_processing_system7_1_axi_periph_WSTRB;
  wire m01_couplers_to_processing_system7_1_axi_periph_WVALID;
  wire [11:0]m02_couplers_to_processing_system7_1_axi_periph_ARADDR;
  wire [1:0]m02_couplers_to_processing_system7_1_axi_periph_ARBURST;
  wire [3:0]m02_couplers_to_processing_system7_1_axi_periph_ARCACHE;
  wire [11:0]m02_couplers_to_processing_system7_1_axi_periph_ARID;
  wire [7:0]m02_couplers_to_processing_system7_1_axi_periph_ARLEN;
  wire m02_couplers_to_processing_system7_1_axi_periph_ARLOCK;
  wire [2:0]m02_couplers_to_processing_system7_1_axi_periph_ARPROT;
  wire m02_couplers_to_processing_system7_1_axi_periph_ARREADY;
  wire [2:0]m02_couplers_to_processing_system7_1_axi_periph_ARSIZE;
  wire m02_couplers_to_processing_system7_1_axi_periph_ARVALID;
  wire [11:0]m02_couplers_to_processing_system7_1_axi_periph_AWADDR;
  wire [1:0]m02_couplers_to_processing_system7_1_axi_periph_AWBURST;
  wire [3:0]m02_couplers_to_processing_system7_1_axi_periph_AWCACHE;
  wire [11:0]m02_couplers_to_processing_system7_1_axi_periph_AWID;
  wire [7:0]m02_couplers_to_processing_system7_1_axi_periph_AWLEN;
  wire m02_couplers_to_processing_system7_1_axi_periph_AWLOCK;
  wire [2:0]m02_couplers_to_processing_system7_1_axi_periph_AWPROT;
  wire m02_couplers_to_processing_system7_1_axi_periph_AWREADY;
  wire [2:0]m02_couplers_to_processing_system7_1_axi_periph_AWSIZE;
  wire m02_couplers_to_processing_system7_1_axi_periph_AWVALID;
  wire [11:0]m02_couplers_to_processing_system7_1_axi_periph_BID;
  wire m02_couplers_to_processing_system7_1_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_processing_system7_1_axi_periph_BRESP;
  wire m02_couplers_to_processing_system7_1_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_processing_system7_1_axi_periph_RDATA;
  wire [11:0]m02_couplers_to_processing_system7_1_axi_periph_RID;
  wire m02_couplers_to_processing_system7_1_axi_periph_RLAST;
  wire m02_couplers_to_processing_system7_1_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_processing_system7_1_axi_periph_RRESP;
  wire m02_couplers_to_processing_system7_1_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_processing_system7_1_axi_periph_WDATA;
  wire m02_couplers_to_processing_system7_1_axi_periph_WLAST;
  wire m02_couplers_to_processing_system7_1_axi_periph_WREADY;
  wire [3:0]m02_couplers_to_processing_system7_1_axi_periph_WSTRB;
  wire m02_couplers_to_processing_system7_1_axi_periph_WVALID;
  wire processing_system7_1_axi_periph_ACLK_net;
  wire [0:0]processing_system7_1_axi_periph_ARESETN_net;
  wire [31:0]processing_system7_1_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]processing_system7_1_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]processing_system7_1_axi_periph_to_s00_couplers_ARCACHE;
  wire [11:0]processing_system7_1_axi_periph_to_s00_couplers_ARID;
  wire [3:0]processing_system7_1_axi_periph_to_s00_couplers_ARLEN;
  wire [1:0]processing_system7_1_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]processing_system7_1_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]processing_system7_1_axi_periph_to_s00_couplers_ARQOS;
  wire processing_system7_1_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]processing_system7_1_axi_periph_to_s00_couplers_ARSIZE;
  wire processing_system7_1_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]processing_system7_1_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]processing_system7_1_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]processing_system7_1_axi_periph_to_s00_couplers_AWCACHE;
  wire [11:0]processing_system7_1_axi_periph_to_s00_couplers_AWID;
  wire [3:0]processing_system7_1_axi_periph_to_s00_couplers_AWLEN;
  wire [1:0]processing_system7_1_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]processing_system7_1_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]processing_system7_1_axi_periph_to_s00_couplers_AWQOS;
  wire processing_system7_1_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]processing_system7_1_axi_periph_to_s00_couplers_AWSIZE;
  wire processing_system7_1_axi_periph_to_s00_couplers_AWVALID;
  wire [11:0]processing_system7_1_axi_periph_to_s00_couplers_BID;
  wire processing_system7_1_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]processing_system7_1_axi_periph_to_s00_couplers_BRESP;
  wire processing_system7_1_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]processing_system7_1_axi_periph_to_s00_couplers_RDATA;
  wire [11:0]processing_system7_1_axi_periph_to_s00_couplers_RID;
  wire processing_system7_1_axi_periph_to_s00_couplers_RLAST;
  wire processing_system7_1_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]processing_system7_1_axi_periph_to_s00_couplers_RRESP;
  wire processing_system7_1_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]processing_system7_1_axi_periph_to_s00_couplers_WDATA;
  wire [11:0]processing_system7_1_axi_periph_to_s00_couplers_WID;
  wire processing_system7_1_axi_periph_to_s00_couplers_WLAST;
  wire processing_system7_1_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]processing_system7_1_axi_periph_to_s00_couplers_WSTRB;
  wire processing_system7_1_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [11:0]s00_couplers_to_xbar_ARID;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [0:0]s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [11:0]s00_couplers_to_xbar_AWID;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire [0:0]s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire s00_couplers_to_xbar_AWVALID;
  wire [11:0]s00_couplers_to_xbar_BID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [11:0]s00_couplers_to_xbar_RID;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [11:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [11:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [11:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [11:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [3:2]xbar_to_m01_couplers_ARBURST;
  wire [7:4]xbar_to_m01_couplers_ARCACHE;
  wire [23:12]xbar_to_m01_couplers_ARID;
  wire [15:8]xbar_to_m01_couplers_ARLEN;
  wire [1:1]xbar_to_m01_couplers_ARLOCK;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire xbar_to_m01_couplers_ARREADY;
  wire [5:3]xbar_to_m01_couplers_ARSIZE;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [3:2]xbar_to_m01_couplers_AWBURST;
  wire [7:4]xbar_to_m01_couplers_AWCACHE;
  wire [23:12]xbar_to_m01_couplers_AWID;
  wire [15:8]xbar_to_m01_couplers_AWLEN;
  wire [1:1]xbar_to_m01_couplers_AWLOCK;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire xbar_to_m01_couplers_AWREADY;
  wire [5:3]xbar_to_m01_couplers_AWSIZE;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [11:0]xbar_to_m01_couplers_BID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [11:0]xbar_to_m01_couplers_RID;
  wire xbar_to_m01_couplers_RLAST;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [1:1]xbar_to_m01_couplers_WLAST;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [5:4]xbar_to_m02_couplers_ARBURST;
  wire [11:8]xbar_to_m02_couplers_ARCACHE;
  wire [35:24]xbar_to_m02_couplers_ARID;
  wire [23:16]xbar_to_m02_couplers_ARLEN;
  wire [2:2]xbar_to_m02_couplers_ARLOCK;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire xbar_to_m02_couplers_ARREADY;
  wire [8:6]xbar_to_m02_couplers_ARSIZE;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [5:4]xbar_to_m02_couplers_AWBURST;
  wire [11:8]xbar_to_m02_couplers_AWCACHE;
  wire [35:24]xbar_to_m02_couplers_AWID;
  wire [23:16]xbar_to_m02_couplers_AWLEN;
  wire [2:2]xbar_to_m02_couplers_AWLOCK;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire xbar_to_m02_couplers_AWREADY;
  wire [8:6]xbar_to_m02_couplers_AWSIZE;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [11:0]xbar_to_m02_couplers_BID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [11:0]xbar_to_m02_couplers_RID;
  wire xbar_to_m02_couplers_RLAST;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [2:2]xbar_to_m02_couplers_WLAST;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN[0];
  assign M00_AXI_araddr[8:0] = m00_couplers_to_processing_system7_1_axi_periph_ARADDR;
  assign M00_AXI_arvalid = m00_couplers_to_processing_system7_1_axi_periph_ARVALID;
  assign M00_AXI_awaddr[8:0] = m00_couplers_to_processing_system7_1_axi_periph_AWADDR;
  assign M00_AXI_awvalid = m00_couplers_to_processing_system7_1_axi_periph_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_processing_system7_1_axi_periph_BREADY;
  assign M00_AXI_rready = m00_couplers_to_processing_system7_1_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_processing_system7_1_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_processing_system7_1_axi_periph_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_processing_system7_1_axi_periph_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN[0];
  assign M01_AXI_araddr[23:0] = m01_couplers_to_processing_system7_1_axi_periph_ARADDR;
  assign M01_AXI_arburst[1:0] = m01_couplers_to_processing_system7_1_axi_periph_ARBURST;
  assign M01_AXI_arcache[3:0] = m01_couplers_to_processing_system7_1_axi_periph_ARCACHE;
  assign M01_AXI_arid[11:0] = m01_couplers_to_processing_system7_1_axi_periph_ARID;
  assign M01_AXI_arlen[7:0] = m01_couplers_to_processing_system7_1_axi_periph_ARLEN;
  assign M01_AXI_arlock = m01_couplers_to_processing_system7_1_axi_periph_ARLOCK;
  assign M01_AXI_arprot[2:0] = m01_couplers_to_processing_system7_1_axi_periph_ARPROT;
  assign M01_AXI_arsize[2:0] = m01_couplers_to_processing_system7_1_axi_periph_ARSIZE;
  assign M01_AXI_arvalid = m01_couplers_to_processing_system7_1_axi_periph_ARVALID;
  assign M01_AXI_awaddr[23:0] = m01_couplers_to_processing_system7_1_axi_periph_AWADDR;
  assign M01_AXI_awburst[1:0] = m01_couplers_to_processing_system7_1_axi_periph_AWBURST;
  assign M01_AXI_awcache[3:0] = m01_couplers_to_processing_system7_1_axi_periph_AWCACHE;
  assign M01_AXI_awid[11:0] = m01_couplers_to_processing_system7_1_axi_periph_AWID;
  assign M01_AXI_awlen[7:0] = m01_couplers_to_processing_system7_1_axi_periph_AWLEN;
  assign M01_AXI_awlock = m01_couplers_to_processing_system7_1_axi_periph_AWLOCK;
  assign M01_AXI_awprot[2:0] = m01_couplers_to_processing_system7_1_axi_periph_AWPROT;
  assign M01_AXI_awsize[2:0] = m01_couplers_to_processing_system7_1_axi_periph_AWSIZE;
  assign M01_AXI_awvalid = m01_couplers_to_processing_system7_1_axi_periph_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_processing_system7_1_axi_periph_BREADY;
  assign M01_AXI_rready = m01_couplers_to_processing_system7_1_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_processing_system7_1_axi_periph_WDATA;
  assign M01_AXI_wlast = m01_couplers_to_processing_system7_1_axi_periph_WLAST;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_processing_system7_1_axi_periph_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_processing_system7_1_axi_periph_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN[0];
  assign M02_AXI_araddr[11:0] = m02_couplers_to_processing_system7_1_axi_periph_ARADDR;
  assign M02_AXI_arburst[1:0] = m02_couplers_to_processing_system7_1_axi_periph_ARBURST;
  assign M02_AXI_arcache[3:0] = m02_couplers_to_processing_system7_1_axi_periph_ARCACHE;
  assign M02_AXI_arid[11:0] = m02_couplers_to_processing_system7_1_axi_periph_ARID;
  assign M02_AXI_arlen[7:0] = m02_couplers_to_processing_system7_1_axi_periph_ARLEN;
  assign M02_AXI_arlock = m02_couplers_to_processing_system7_1_axi_periph_ARLOCK;
  assign M02_AXI_arprot[2:0] = m02_couplers_to_processing_system7_1_axi_periph_ARPROT;
  assign M02_AXI_arsize[2:0] = m02_couplers_to_processing_system7_1_axi_periph_ARSIZE;
  assign M02_AXI_arvalid = m02_couplers_to_processing_system7_1_axi_periph_ARVALID;
  assign M02_AXI_awaddr[11:0] = m02_couplers_to_processing_system7_1_axi_periph_AWADDR;
  assign M02_AXI_awburst[1:0] = m02_couplers_to_processing_system7_1_axi_periph_AWBURST;
  assign M02_AXI_awcache[3:0] = m02_couplers_to_processing_system7_1_axi_periph_AWCACHE;
  assign M02_AXI_awid[11:0] = m02_couplers_to_processing_system7_1_axi_periph_AWID;
  assign M02_AXI_awlen[7:0] = m02_couplers_to_processing_system7_1_axi_periph_AWLEN;
  assign M02_AXI_awlock = m02_couplers_to_processing_system7_1_axi_periph_AWLOCK;
  assign M02_AXI_awprot[2:0] = m02_couplers_to_processing_system7_1_axi_periph_AWPROT;
  assign M02_AXI_awsize[2:0] = m02_couplers_to_processing_system7_1_axi_periph_AWSIZE;
  assign M02_AXI_awvalid = m02_couplers_to_processing_system7_1_axi_periph_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_processing_system7_1_axi_periph_BREADY;
  assign M02_AXI_rready = m02_couplers_to_processing_system7_1_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_processing_system7_1_axi_periph_WDATA;
  assign M02_AXI_wlast = m02_couplers_to_processing_system7_1_axi_periph_WLAST;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_processing_system7_1_axi_periph_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_processing_system7_1_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN[0];
  assign S00_AXI_arready = processing_system7_1_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = processing_system7_1_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = processing_system7_1_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = processing_system7_1_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = processing_system7_1_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = processing_system7_1_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = processing_system7_1_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = processing_system7_1_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = processing_system7_1_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = processing_system7_1_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = processing_system7_1_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_processing_system7_1_axi_periph_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_processing_system7_1_axi_periph_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_processing_system7_1_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_processing_system7_1_axi_periph_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_processing_system7_1_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_processing_system7_1_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_processing_system7_1_axi_periph_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_processing_system7_1_axi_periph_WREADY = M00_AXI_wready;
  assign m01_couplers_to_processing_system7_1_axi_periph_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_processing_system7_1_axi_periph_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_processing_system7_1_axi_periph_BID = M01_AXI_bid[11:0];
  assign m01_couplers_to_processing_system7_1_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_processing_system7_1_axi_periph_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_processing_system7_1_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_processing_system7_1_axi_periph_RID = M01_AXI_rid[11:0];
  assign m01_couplers_to_processing_system7_1_axi_periph_RLAST = M01_AXI_rlast;
  assign m01_couplers_to_processing_system7_1_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_processing_system7_1_axi_periph_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_processing_system7_1_axi_periph_WREADY = M01_AXI_wready;
  assign m02_couplers_to_processing_system7_1_axi_periph_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_processing_system7_1_axi_periph_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_processing_system7_1_axi_periph_BID = M02_AXI_bid[11:0];
  assign m02_couplers_to_processing_system7_1_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_processing_system7_1_axi_periph_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_processing_system7_1_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_processing_system7_1_axi_periph_RID = M02_AXI_rid[11:0];
  assign m02_couplers_to_processing_system7_1_axi_periph_RLAST = M02_AXI_rlast;
  assign m02_couplers_to_processing_system7_1_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_processing_system7_1_axi_periph_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_processing_system7_1_axi_periph_WREADY = M02_AXI_wready;
  assign processing_system7_1_axi_periph_ACLK_net = ACLK;
  assign processing_system7_1_axi_periph_ARESETN_net = ARESETN[0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign processing_system7_1_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign processing_system7_1_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign processing_system7_1_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign processing_system7_1_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign processing_system7_1_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign processing_system7_1_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
m00_couplers_imp_1N1SYRA m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_processing_system7_1_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_processing_system7_1_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_processing_system7_1_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_processing_system7_1_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_processing_system7_1_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_processing_system7_1_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_processing_system7_1_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_processing_system7_1_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_processing_system7_1_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_processing_system7_1_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_processing_system7_1_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_processing_system7_1_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_processing_system7_1_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_processing_system7_1_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_processing_system7_1_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_processing_system7_1_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_processing_system7_1_axi_periph_WVALID),
        .S_ACLK(processing_system7_1_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_1_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
m01_couplers_imp_GDZ1S8 m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_processing_system7_1_axi_periph_ARADDR),
        .M_AXI_arburst(m01_couplers_to_processing_system7_1_axi_periph_ARBURST),
        .M_AXI_arcache(m01_couplers_to_processing_system7_1_axi_periph_ARCACHE),
        .M_AXI_arid(m01_couplers_to_processing_system7_1_axi_periph_ARID),
        .M_AXI_arlen(m01_couplers_to_processing_system7_1_axi_periph_ARLEN),
        .M_AXI_arlock(m01_couplers_to_processing_system7_1_axi_periph_ARLOCK),
        .M_AXI_arprot(m01_couplers_to_processing_system7_1_axi_periph_ARPROT),
        .M_AXI_arready(m01_couplers_to_processing_system7_1_axi_periph_ARREADY),
        .M_AXI_arsize(m01_couplers_to_processing_system7_1_axi_periph_ARSIZE),
        .M_AXI_arvalid(m01_couplers_to_processing_system7_1_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_processing_system7_1_axi_periph_AWADDR),
        .M_AXI_awburst(m01_couplers_to_processing_system7_1_axi_periph_AWBURST),
        .M_AXI_awcache(m01_couplers_to_processing_system7_1_axi_periph_AWCACHE),
        .M_AXI_awid(m01_couplers_to_processing_system7_1_axi_periph_AWID),
        .M_AXI_awlen(m01_couplers_to_processing_system7_1_axi_periph_AWLEN),
        .M_AXI_awlock(m01_couplers_to_processing_system7_1_axi_periph_AWLOCK),
        .M_AXI_awprot(m01_couplers_to_processing_system7_1_axi_periph_AWPROT),
        .M_AXI_awready(m01_couplers_to_processing_system7_1_axi_periph_AWREADY),
        .M_AXI_awsize(m01_couplers_to_processing_system7_1_axi_periph_AWSIZE),
        .M_AXI_awvalid(m01_couplers_to_processing_system7_1_axi_periph_AWVALID),
        .M_AXI_bid(m01_couplers_to_processing_system7_1_axi_periph_BID),
        .M_AXI_bready(m01_couplers_to_processing_system7_1_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_processing_system7_1_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_processing_system7_1_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_processing_system7_1_axi_periph_RDATA),
        .M_AXI_rid(m01_couplers_to_processing_system7_1_axi_periph_RID),
        .M_AXI_rlast(m01_couplers_to_processing_system7_1_axi_periph_RLAST),
        .M_AXI_rready(m01_couplers_to_processing_system7_1_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_processing_system7_1_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_processing_system7_1_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_processing_system7_1_axi_periph_WDATA),
        .M_AXI_wlast(m01_couplers_to_processing_system7_1_axi_periph_WLAST),
        .M_AXI_wready(m01_couplers_to_processing_system7_1_axi_periph_WREADY),
        .M_AXI_wstrb(m01_couplers_to_processing_system7_1_axi_periph_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_processing_system7_1_axi_periph_WVALID),
        .S_ACLK(processing_system7_1_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_1_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR[55:32]),
        .S_AXI_arburst(xbar_to_m01_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m01_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m01_couplers_ARID),
        .S_AXI_arlen(xbar_to_m01_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m01_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arsize(xbar_to_m01_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR[55:32]),
        .S_AXI_awburst(xbar_to_m01_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m01_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m01_couplers_AWID),
        .S_AXI_awlen(xbar_to_m01_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m01_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awsize(xbar_to_m01_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m01_couplers_BID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rid(xbar_to_m01_couplers_RID),
        .S_AXI_rlast(xbar_to_m01_couplers_RLAST),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m01_couplers_WLAST),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
m02_couplers_imp_1LR7J63 m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_processing_system7_1_axi_periph_ARADDR),
        .M_AXI_arburst(m02_couplers_to_processing_system7_1_axi_periph_ARBURST),
        .M_AXI_arcache(m02_couplers_to_processing_system7_1_axi_periph_ARCACHE),
        .M_AXI_arid(m02_couplers_to_processing_system7_1_axi_periph_ARID),
        .M_AXI_arlen(m02_couplers_to_processing_system7_1_axi_periph_ARLEN),
        .M_AXI_arlock(m02_couplers_to_processing_system7_1_axi_periph_ARLOCK),
        .M_AXI_arprot(m02_couplers_to_processing_system7_1_axi_periph_ARPROT),
        .M_AXI_arready(m02_couplers_to_processing_system7_1_axi_periph_ARREADY),
        .M_AXI_arsize(m02_couplers_to_processing_system7_1_axi_periph_ARSIZE),
        .M_AXI_arvalid(m02_couplers_to_processing_system7_1_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_processing_system7_1_axi_periph_AWADDR),
        .M_AXI_awburst(m02_couplers_to_processing_system7_1_axi_periph_AWBURST),
        .M_AXI_awcache(m02_couplers_to_processing_system7_1_axi_periph_AWCACHE),
        .M_AXI_awid(m02_couplers_to_processing_system7_1_axi_periph_AWID),
        .M_AXI_awlen(m02_couplers_to_processing_system7_1_axi_periph_AWLEN),
        .M_AXI_awlock(m02_couplers_to_processing_system7_1_axi_periph_AWLOCK),
        .M_AXI_awprot(m02_couplers_to_processing_system7_1_axi_periph_AWPROT),
        .M_AXI_awready(m02_couplers_to_processing_system7_1_axi_periph_AWREADY),
        .M_AXI_awsize(m02_couplers_to_processing_system7_1_axi_periph_AWSIZE),
        .M_AXI_awvalid(m02_couplers_to_processing_system7_1_axi_periph_AWVALID),
        .M_AXI_bid(m02_couplers_to_processing_system7_1_axi_periph_BID),
        .M_AXI_bready(m02_couplers_to_processing_system7_1_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_processing_system7_1_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_processing_system7_1_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_processing_system7_1_axi_periph_RDATA),
        .M_AXI_rid(m02_couplers_to_processing_system7_1_axi_periph_RID),
        .M_AXI_rlast(m02_couplers_to_processing_system7_1_axi_periph_RLAST),
        .M_AXI_rready(m02_couplers_to_processing_system7_1_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_processing_system7_1_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_processing_system7_1_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_processing_system7_1_axi_periph_WDATA),
        .M_AXI_wlast(m02_couplers_to_processing_system7_1_axi_periph_WLAST),
        .M_AXI_wready(m02_couplers_to_processing_system7_1_axi_periph_WREADY),
        .M_AXI_wstrb(m02_couplers_to_processing_system7_1_axi_periph_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_processing_system7_1_axi_periph_WVALID),
        .S_ACLK(processing_system7_1_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_1_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR[75:64]),
        .S_AXI_arburst(xbar_to_m02_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m02_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m02_couplers_ARID),
        .S_AXI_arlen(xbar_to_m02_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m02_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arsize(xbar_to_m02_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR[75:64]),
        .S_AXI_awburst(xbar_to_m02_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m02_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m02_couplers_AWID),
        .S_AXI_awlen(xbar_to_m02_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m02_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awsize(xbar_to_m02_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m02_couplers_BID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rid(xbar_to_m02_couplers_RID),
        .S_AXI_rlast(xbar_to_m02_couplers_RLAST),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m02_couplers_WLAST),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
s00_couplers_imp_DV8YS4 s00_couplers
       (.M_ACLK(processing_system7_1_axi_periph_ACLK_net),
        .M_ARESETN(processing_system7_1_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s00_couplers_to_xbar_ARID),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s00_couplers_to_xbar_AWID),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s00_couplers_to_xbar_BID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rid(s00_couplers_to_xbar_RID),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(processing_system7_1_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(processing_system7_1_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(processing_system7_1_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(processing_system7_1_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(processing_system7_1_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(processing_system7_1_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(processing_system7_1_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(processing_system7_1_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(processing_system7_1_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(processing_system7_1_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(processing_system7_1_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(processing_system7_1_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(processing_system7_1_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(processing_system7_1_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(processing_system7_1_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(processing_system7_1_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(processing_system7_1_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(processing_system7_1_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(processing_system7_1_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(processing_system7_1_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(processing_system7_1_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(processing_system7_1_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(processing_system7_1_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(processing_system7_1_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(processing_system7_1_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(processing_system7_1_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(processing_system7_1_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(processing_system7_1_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(processing_system7_1_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(processing_system7_1_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(processing_system7_1_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(processing_system7_1_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(processing_system7_1_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wid(processing_system7_1_axi_periph_to_s00_couplers_WID),
        .S_AXI_wlast(processing_system7_1_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(processing_system7_1_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(processing_system7_1_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(processing_system7_1_axi_periph_to_s00_couplers_WVALID));
zynq_1_xbar_0 xbar
       (.aclk(processing_system7_1_axi_periph_ACLK_net),
        .aresetn(processing_system7_1_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arburst({xbar_to_m02_couplers_ARBURST,xbar_to_m01_couplers_ARBURST,xbar_to_m00_couplers_ARBURST}),
        .m_axi_arcache({xbar_to_m02_couplers_ARCACHE,xbar_to_m01_couplers_ARCACHE,xbar_to_m00_couplers_ARCACHE}),
        .m_axi_arid({xbar_to_m02_couplers_ARID,xbar_to_m01_couplers_ARID,xbar_to_m00_couplers_ARID}),
        .m_axi_arlen({xbar_to_m02_couplers_ARLEN,xbar_to_m01_couplers_ARLEN,xbar_to_m00_couplers_ARLEN}),
        .m_axi_arlock({xbar_to_m02_couplers_ARLOCK,xbar_to_m01_couplers_ARLOCK,xbar_to_m00_couplers_ARLOCK}),
        .m_axi_arprot({xbar_to_m02_couplers_ARPROT,xbar_to_m01_couplers_ARPROT,xbar_to_m00_couplers_ARPROT}),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize({xbar_to_m02_couplers_ARSIZE,xbar_to_m01_couplers_ARSIZE,xbar_to_m00_couplers_ARSIZE}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awburst({xbar_to_m02_couplers_AWBURST,xbar_to_m01_couplers_AWBURST,xbar_to_m00_couplers_AWBURST}),
        .m_axi_awcache({xbar_to_m02_couplers_AWCACHE,xbar_to_m01_couplers_AWCACHE,xbar_to_m00_couplers_AWCACHE}),
        .m_axi_awid({xbar_to_m02_couplers_AWID,xbar_to_m01_couplers_AWID,xbar_to_m00_couplers_AWID}),
        .m_axi_awlen({xbar_to_m02_couplers_AWLEN,xbar_to_m01_couplers_AWLEN,xbar_to_m00_couplers_AWLEN}),
        .m_axi_awlock({xbar_to_m02_couplers_AWLOCK,xbar_to_m01_couplers_AWLOCK,xbar_to_m00_couplers_AWLOCK}),
        .m_axi_awprot({xbar_to_m02_couplers_AWPROT,xbar_to_m01_couplers_AWPROT,xbar_to_m00_couplers_AWPROT}),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready({xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize({xbar_to_m02_couplers_AWSIZE,xbar_to_m01_couplers_AWSIZE,xbar_to_m00_couplers_AWSIZE}),
        .m_axi_awvalid({xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bid({xbar_to_m02_couplers_BID,xbar_to_m01_couplers_BID,xbar_to_m00_couplers_BID}),
        .m_axi_bready({xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rid({xbar_to_m02_couplers_RID,xbar_to_m01_couplers_RID,xbar_to_m00_couplers_RID}),
        .m_axi_rlast({xbar_to_m02_couplers_RLAST,xbar_to_m01_couplers_RLAST,xbar_to_m00_couplers_RLAST}),
        .m_axi_rready({xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wlast({xbar_to_m02_couplers_WLAST,xbar_to_m01_couplers_WLAST,xbar_to_m00_couplers_WLAST}),
        .m_axi_wready({xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arburst(s00_couplers_to_xbar_ARBURST),
        .s_axi_arcache(s00_couplers_to_xbar_ARCACHE),
        .s_axi_arid(s00_couplers_to_xbar_ARID),
        .s_axi_arlen(s00_couplers_to_xbar_ARLEN),
        .s_axi_arlock(s00_couplers_to_xbar_ARLOCK),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arqos(s00_couplers_to_xbar_ARQOS),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize(s00_couplers_to_xbar_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awburst(s00_couplers_to_xbar_AWBURST),
        .s_axi_awcache(s00_couplers_to_xbar_AWCACHE),
        .s_axi_awid(s00_couplers_to_xbar_AWID),
        .s_axi_awlen(s00_couplers_to_xbar_AWLEN),
        .s_axi_awlock(s00_couplers_to_xbar_AWLOCK),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awqos(s00_couplers_to_xbar_AWQOS),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awsize(s00_couplers_to_xbar_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bid(s00_couplers_to_xbar_BID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rid(s00_couplers_to_xbar_RID),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wlast(s00_couplers_to_xbar_WLAST),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule
