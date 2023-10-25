class ProductListResponse {
  ProductListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  late final bool status;
  late final String message;
  late final ProductData data;

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = ProductData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class ProductData {
  ProductData({
    required this.items,
    required this.totalCount,
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
  });

  late final List<Product> items;
  late final int totalCount;
  late final int currentPage;
  late final int pageSize;
  late final int totalItems;

  ProductData.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Product.fromJson(e)).toList();
    totalCount = json['totalCount'];
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e) => e.toJson()).toList();
    _data['totalCount'] = totalCount;
    _data['currentPage'] = currentPage;
    _data['pageSize'] = pageSize;
    _data['totalItems'] = totalItems;
    return _data;
  }
}

class Product {
  Product({
    required this.id,
    required this.productno,
    this.rev,
    this.alpha,
    this.description,
    this.configuration,
    this.llc,
    this.leveL1,
    this.type,
    this.ecr,
    this.listprice,
    this.comments,
    this.active,
    this.labeL_DESC,
    this.producT_SPEC,
    this.labeL_CONFIG,
    this.datE_REQ,
    this.datE_DUE,
    this.level2,
    this.level3,
    this.level4,
    this.level5,
    this.sequenceNum,
    this.locationWares,
    this.locationAccpac,
    this.locationMisys,
    this.level6,
    this.level7,
    this.instGuide,
  });

  late final int id;
  late final String productno;
  late final String? rev;
  late final String? alpha;
  late final String? description;
  late final String? configuration;
  late final int? llc;
  late final String? leveL1;
  late final String? type;
  late final String? ecr;
  late final int? listprice;
  late final String? comments;
  late final String? active;
  late final String? labeL_DESC;
  late final String? producT_SPEC;
  late final String? labeL_CONFIG;
  late final String? datE_REQ;
  late final String? datE_DUE;
  late final String? level2;
  late final String? level3;
  late final String? level4;
  late final String? level5;
  late final int? sequenceNum;
  late final String? locationWares;
  late final String? locationAccpac;
  late final String? locationMisys;
  late final String? level6;
  late final String? level7;
  late final String? instGuide;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productno = json['productno'];
    rev = json['rev'];
    alpha = json['alpha'];
    description = json['description'];
    configuration = json['configuration'];
    llc = json['llc'];
    leveL1 = json['level1'];
    type = json['type'];
    ecr = json['ecr'];
    listprice = json['listprice'];
    comments = json['comments'];
    active = json['active'];
    labeL_DESC = json['labelDesc'];
    producT_SPEC = json['productSpec'];
    labeL_CONFIG = json['labelConfig'];
    datE_REQ = json['dateReq'];
    datE_DUE = json['dateDue'];
    level2 = json['level2'];
    level3 = json['level3'];
    level4 = json['level4'];
    level5 = json['level5'];
    sequenceNum = json['sequenceNum'];
    locationWares = json['locationWares'];
    locationAccpac = json['locationAccpac'];
    locationMisys = json['locationMisys'];
    level6 = json['level6'];
    level7 = json['level7'];
    instGuide = json['instGuide'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['productno'] = productno;
    _data['rev'] = rev;
    _data['alpha'] = alpha;
    _data['description'] = description;
    _data['configuration'] = configuration;
    _data['llc'] = llc;
    _data['level1'] = leveL1;
    _data['type'] = type;
    _data['ecr'] = ecr;
    _data['listprice'] = listprice;
    _data['comments'] = comments;
    _data['active'] = active;
    _data['labelDesc'] = labeL_DESC;
    _data['productSpec'] = producT_SPEC;
    _data['labelConfig'] = labeL_CONFIG;
    _data['dateReq'] = datE_REQ;
    _data['dateDue'] = datE_DUE;
    _data['level2'] = level2;
    _data['level3'] = level3;
    _data['level4'] = level4;
    _data['level5'] = level5;
    _data['sequenceNum'] = sequenceNum;
    _data['locationWares'] = locationWares;
    _data['locationAccpac'] = locationAccpac;
    _data['locationMisys'] = locationMisys;
    _data['level6'] = level6;
    _data['level7'] = level7;
    _data['instGuide'] = instGuide;
    return _data;


  }
  @override
  String toString() {
    return 'Product{id: $id, productno: $productno, rev: $rev, description: $description, configuration: $configuration, llc: $llc, level1: $leveL1, type: $type, ecr: $ecr, listprice: $listprice, comments: $comments, active: $active, labelDesc: $labeL_DESC, productSpec: $producT_SPEC, labelConfig: $labeL_CONFIG, dateReq: $datE_REQ, dateDue: $datE_DUE, level2: $level2, level3: $level3, level4: $level4, level5: $level5, sequenceNum: $sequenceNum, locationWares: $locationWares, locationAccpac: $locationAccpac, locationMisys: $locationMisys, level6: $level6, level7: $level7, instGuide: $instGuide}';
  }
}
