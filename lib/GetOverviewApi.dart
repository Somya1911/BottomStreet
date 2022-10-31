class GetOverviewApi {
  int? iD;
  String? security;
  int? industryID;
  String? industry;
  int? sectorID;
  String? sector;
  double? mCAP;
  Null? eV;
  Null? eVDateEnd;
  double? bookNavPerShare;
  double? tTMPE;
  int? tTMYearEnd;
  double? yield;
  int? yearEnd;
  String? sectorSlug;
  String? industrySlug;
  String? securitySlug;
  double? pEGRatio;

  GetOverviewApi(
      {this.iD,
        this.security,
        this.industryID,
        this.industry,
        this.sectorID,
        this.sector,
        this.mCAP,
        this.eV,
        this.eVDateEnd,
        this.bookNavPerShare,
        this.tTMPE,
        this.tTMYearEnd,
        this.yield,
        this.yearEnd,
        this.sectorSlug,
        this.industrySlug,
        this.securitySlug,
        this.pEGRatio});

  GetOverviewApi.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    security = json['Security'];
    industryID = json['IndustryID'];
    industry = json['Industry'];
    sectorID = json['SectorID'];
    sector = json['Sector'];
    mCAP = json['MCAP'];
    eV = json['EV'];
    eVDateEnd = json['EVDateEnd'];
    bookNavPerShare = json['BookNavPerShare'];
    tTMPE = json['TTMPE'];
    tTMYearEnd = json['TTMYearEnd'];
    yield = json['Yield'];
    yearEnd = json['YearEnd'];
    sectorSlug = json['SectorSlug'];
    industrySlug = json['IndustrySlug'];
    securitySlug = json['SecuritySlug'];
    pEGRatio = json['PEGRatio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Security'] = this.security;
    data['IndustryID'] = this.industryID;
    data['Industry'] = this.industry;
    data['SectorID'] = this.sectorID;
    data['Sector'] = this.sector;
    data['MCAP'] = this.mCAP;
    data['EV'] = this.eV;
    data['EVDateEnd'] = this.eVDateEnd;
    data['BookNavPerShare'] = this.bookNavPerShare;
    data['TTMPE'] = this.tTMPE;
    data['TTMYearEnd'] = this.tTMYearEnd;
    data['Yield'] = this.yield;
    data['YearEnd'] = this.yearEnd;
    data['SectorSlug'] = this.sectorSlug;
    data['IndustrySlug'] = this.industrySlug;
    data['SecuritySlug'] = this.securitySlug;
    data['PEGRatio'] = this.pEGRatio;
    return data;
  }
}