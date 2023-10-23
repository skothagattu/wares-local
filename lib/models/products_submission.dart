class ProductSubmission {
  String productno;
  String rev;
  String? description;
  String? configuration;
  int llc;
  String? listPrice;
  String? leveL1;
  String? type;
  String? comments;
  String? ecr;
  String active;
  String? labeLDESC;
  String? producTSPEC;
  String? labeLCONFIG;
  String? datEREQ;
  String? datEDUE;
  String? leveL2;
  String? leveL3;
  String? leveL4;
  String? leveL5;
  String? sequencENUM;String? locatioNWARES;String? locatioNACCPAC;
  String? locatioNMISYS;
  String? leveL6;
  String? leveL7;
  String? insTGUIDE;



  // ... other fields ...

  ProductSubmission({
    required this.productno,
    required this.rev,
    this.description,
    this.configuration,
    required this.llc,
    this.listPrice,
    this.leveL1,
    this.type,
    required this.comments,
    this.ecr,
    required this.active,
    this.labeLDESC,
    this.producTSPEC,
    this.labeLCONFIG,
    this.datEREQ,
    this.datEDUE,
    this.leveL2,
    this.leveL3,
    this.leveL4,
    this.leveL5,
    this.sequencENUM,
    this.locatioNWARES,
    this.locatioNACCPAC,
    this.locatioNMISYS,
    this.leveL6,
    this.leveL7,
    this.insTGUIDE,
    // ... other fields ...
  });

  Map<String, dynamic> toJson() => {
    'productno': productno,
    'rev': rev,
    'description': description,
    'configuration': configuration,
    'llc': llc,
    'listPrice': listPrice,
    'leveL1': leveL1,
    'type': type,
    'comments': comments,
    'ecr': ecr,
    'active': active,
    'labeL_DESC': labeLDESC,
    'producT_SPEC': producTSPEC,
    'labeL_CONFIG': labeLCONFIG,
    'datE_REQ': datEREQ,
    'datE_DUE': datEDUE,
    'leveL2' : leveL2,
    'leveL3': leveL3,
    'leveL4': leveL4,
    'leveL5': leveL5,
    'sequencE_NUM': sequencENUM,
    'locatioN_WARES' : locatioNWARES,
    'locatioN_ACCPAC' :locatioNACCPAC,
    'locatioN_MISYS': locatioNMISYS,
    'leveL6': leveL6,
    'leveL7': leveL7,
    'insT_GUIDE': insTGUIDE,


    // ... other fields ...
  };
}
