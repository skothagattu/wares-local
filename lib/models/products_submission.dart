/*
import 'package:wares/models/products.dart';

class ProductSubmission {
  int? id;
  String? productno;
  String? rev;
  String? description;
  String? configuration;
  int? llc;
  int? listprice;
  String? leveL1;
  String? type;
  String? comments;
  String? ecr;
  String? active;
  String? labeL_DESC;
  String? producT_SPEC;
  String? labeL_CONFIG;
  String? datE_REQ;
  String? datE_DUE;
  String? leveL2;
  String? leveL3;
  String? leveL4;
  String? leveL5;
  int? sequencE_NUM;
  String? locatioN_WARES;
  String? locatioN_ACCPAC;
  String? locatioN_MISYS;
  String? leveL6;
  String? leveL7;
  String? insT_GUIDE;

  // ... other fields ...

  ProductSubmission({
     this.id,
     this.productno,
    this.rev,
    this.description,
    this.configuration,
    this.llc,
    this.listprice,
    this.leveL1,
    this.type,
    this.comments,
    this.ecr,
    this.active,
    this.labeL_DESC,
    this.producT_SPEC,
    this.labeL_CONFIG,
    this.datE_REQ,
    this.datE_DUE,
    this.leveL2,
    this.leveL3,
    this.leveL4,
    this.leveL5,
    this.sequencE_NUM,
    this.locatioN_WARES,
    this.locatioN_ACCPAC,
    this.locatioN_MISYS,
    this.leveL6,
    this.leveL7,
    this.insT_GUIDE,
    // ... other fields ...
  });

  factory ProductSubmission.fromProduct(Product product) {
    return ProductSubmission(
      id: product.id,
      productno: product.productno,
      rev: product.rev,
      description: product.description,
      configuration: product.configuration,
      llc: product.llc,
      listprice: product.listprice,
      leveL1: product.leveL1,
      type: product.type,
      comments: product.comments,
      ecr: product.ecr,
      active: product.active,
      labeL_DESC: product.labeL_DESC,
      producT_SPEC: product.producT_SPEC,
      labeL_CONFIG: product.labeL_CONFIG,
      datE_REQ: product.datE_REQ,
      datE_DUE: product.datE_DUE,
      leveL2: product.leveL2,
      leveL3: product.leveL3,
      leveL4: product.leveL4,
      leveL5: product.leveL5,
      sequencE_NUM: product.sequencE_NUM,
      locatioN_WARES: product.locatioN_WARES,
      locatioN_ACCPAC: product.locatioN_ACCPAC,
      locatioN_MISYS: product.locatioN_MISYS,
      leveL6: product.leveL6,
      leveL7: product.leveL7,
      insT_GUIDE: product.insT_GUIDE,
      // ... other fields ...
    );
  }

  Map<String, dynamic> toJson() => {
*/
/*    'id' : id,
    'productno': productno,*//*

    "rev": rev,
    'description': description,
    'configuration': configuration,
    'llc': llc,
    'listprice': listprice,
    'level1': leveL1,
    'type': type,
    'comments': comments,
    'ecr': ecr,
    'active': active,
    'labelDesc': labeL_DESC,
    'productSpec': producT_SPEC,
    'labelConfig': labeL_CONFIG,
    'dateReq': datE_REQ,
    'dateDue': datE_DUE,
    'level2' : leveL2,
    'level3': leveL3,
    'level4': leveL4,
    'level5': leveL5,
    'sequenceNum': sequencE_NUM,
    'locationWares' : locatioN_WARES,
    'locationAccpac' :locatioN_ACCPAC,
    'locationMisys': locatioN_MISYS,
    'level6': leveL6,
    'level7': leveL7,
    'instGuide': insT_GUIDE,
    // ... other fields ...
  };
  @override
  String toString() {
    return 'Product{ rev: $rev, description: $description, configuration: $configuration, llc: $llc, leveL1: $leveL1, type: $type, ecr: $ecr, listprice: $listprice, comments: $comments, active: $active, labeL_DESC: $labeL_DESC, producT_SPEC: $producT_SPEC, labeL_CONFIG: $labeL_CONFIG, datE_REQ: $datE_REQ, datE_DUE: $datE_DUE, leveL2: $leveL2, leveL3: $leveL3, leveL4: $leveL4, leveL5: $leveL5, sequencE_NUM: $sequencE_NUM, locatioN_WARES: $locatioN_WARES, locatioN_ACCPAC: $locatioN_ACCPAC, locatioN_MISYS: $locatioN_MISYS, leveL6: $leveL6, leveL7: $leveL7, insT_GUIDE: $insT_GUIDE}';
  }
}
*/
import 'package:json_annotation/json_annotation.dart';
import 'package:wares/models/products.dart';

part 'products_submission.g.dart';
String? _emptyToNull(String? value) {
  return (value == null || value.trim().isEmpty) ? null : value;
}
@JsonSerializable()
class ProductSubmission {
  final String? id;
  final String? productno;
  final String? rev;
  final String? description;
  final String? configuration;
  final String? llc;
  final String? listprice;
  @JsonKey(name: 'leveL1')
  final String? level1;
  final String? type;
  final String? comments;
  final String? ecr;
  final String? active;
  @JsonKey(name: 'labeL_DESC')
  final String? labelDesc;
  @JsonKey(name: 'producT_SPEC')
  final String? productSpec;
  @JsonKey(name: 'labeL_CONFIG')
  final String? labelConfig;
  @JsonKey(name: 'datE_REQ')
  final String? dateReq;
  @JsonKey(name: 'datE_DUE')
  final String? dateDue;
  @JsonKey(name: 'leveL2')
  final String? level2;
  @JsonKey(name: 'leveL3')
  final String? level3;
  @JsonKey(name: 'leveL4')
  final String? level4;
  @JsonKey(name: 'leveL5')
  final String? level5;
  @JsonKey(name: 'sequencE_NUM')
  final String? sequenceNum;
  @JsonKey(name: 'locatioN_WARES')
  final String? locationWares;
  @JsonKey(name: 'locatioN_ACCPAC')
  final String? locationAccpac;
  @JsonKey(name: 'locatioN_MISYS')
  final String? locationMisys;
  @JsonKey(name: 'leveL6')
  final String? level6;
  @JsonKey(name: 'leveL7')
  final String? level7;
  @JsonKey(name: 'insT_GUIDE')
  final String? instGuide;
  final String? rowVersion;

  ProductSubmission({
    this.id,
    this.productno,
    this.rev,
    this.description,
    this.configuration,
    this.llc,
    this.listprice,
    this.level1,
    this.type,
    this.comments,
    this.ecr,
    this.active,
    this.labelDesc,
    this.productSpec,
    this.labelConfig,
    this.dateReq,
    this.dateDue,
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
    this.rowVersion,
  });

  factory ProductSubmission.fromProduct(Product product) {
    return ProductSubmission(
      id: product.id?.toString(),
      productno: product.productno,
      rev: _emptyToNull(product.rev),
      description: _emptyToNull(product.description),
      configuration: _emptyToNull(product.configuration),
      llc: _emptyToNull(product.llc?.toString()),
      listprice: _emptyToNull(product.listprice?.toString()),
      level1: _emptyToNull(product.leveL1),
      type: _emptyToNull(product.type),
      comments: _emptyToNull(product.comments),
      ecr: _emptyToNull(product.ecr),
      active: _emptyToNull(product.active),
      labelDesc: _emptyToNull(product.labeL_DESC),
      productSpec: _emptyToNull(product.producT_SPEC),
      labelConfig: _emptyToNull(product.labeL_CONFIG),
      dateReq: _emptyToNull(product.datE_REQ),
      dateDue: _emptyToNull(product.datE_DUE),
      level2: _emptyToNull(product.leveL2),
      level3: _emptyToNull(product.leveL3),
      level4: _emptyToNull(product.leveL4),
      level5: _emptyToNull(product.leveL5),
      sequenceNum: _emptyToNull(product.sequencE_NUM?.toString()),
      locationWares: _emptyToNull(product.locatioN_WARES),
      locationAccpac: _emptyToNull(product.locatioN_ACCPAC),
      locationMisys: _emptyToNull(product.locatioN_MISYS),
      level6: _emptyToNull(product.leveL6),
      level7: _emptyToNull(product.leveL7),
      instGuide: _emptyToNull(product.insT_GUIDE),
        rowVersion: _emptyToNull(product.rowVersion),
    );
  }




  factory ProductSubmission.fromJson(Map<String, dynamic> json) => _$ProductSubmissionFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSubmissionToJson(this);
}

