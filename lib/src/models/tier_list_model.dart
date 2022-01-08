enum TypeTierList { mini, hero }

enum TypeList { S, A, B, C, D }

class TierListModel {
  TierListModel({
    required this.tierList,
  });

  TierListModel.fromJson(Map<String, dynamic> json) {
    if (json['tierList'] != null) {
      tierList = <TierListRankModel>[];
      json['tierList'].forEach((dynamic v) {
        tierList.add(TierListRankModel.fromJson(v));
      });
    }
  }

  late List<TierListRankModel> tierList = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tierList'] = tierList.map((v) => v.toJson()).toList();
    return data;
  }
}

class TierListRankModel {
  TierListRankModel({
    required this.listS,
    required this.listA,
    required this.listB,
    required this.listC,
    required this.listD,
    required this.name,
  });

  TierListRankModel.fromJson(Map<String, dynamic> json) {
    if (json['listS'] != null) {
      listS = <TierListMinisModel>[];
      json['listS'].forEach((dynamic v) {
        listS.add(TierListMinisModel.fromJson(v));
      });
    }
    if (json['listA'] != null) {
      listA = <TierListMinisModel>[];
      json['listA'].forEach((dynamic v) {
        listA.add(TierListMinisModel.fromJson(v));
      });
    }
    if (json['listB'] != null) {
      listB = <TierListMinisModel>[];
      json['listB'].forEach((dynamic v) {
        listB.add(TierListMinisModel.fromJson(v));
      });
    }
    if (json['listC'] != null) {
      listC = <TierListMinisModel>[];
      json['listC'].forEach((dynamic v) {
        listC.add(TierListMinisModel.fromJson(v));
      });
    }
    if (json['listD'] != null) {
      listD = <TierListMinisModel>[];
      json['listD'].forEach((dynamic v) {
        listD.add(TierListMinisModel.fromJson(v));
      });
    }
    name = json['name'];
  }

  late List<TierListMinisModel> listS = [];
  late List<TierListMinisModel> listA = [];
  late List<TierListMinisModel> listB = [];
  late List<TierListMinisModel> listC = [];
  late List<TierListMinisModel> listD = [];
  late String name;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['listS'] = listS.map((v) => v.toJson()).toList();
    data['listA'] = listA.map((v) => v.toJson()).toList();
    data['listB'] = listB.map((v) => v.toJson()).toList();
    data['listC'] = listC.map((v) => v.toJson()).toList();
    data['listD'] = listD.map((v) => v.toJson()).toList();
    data['name'] = name;
    return data;
  }
}

class TierListMinisModel {
  TierListMinisModel({
    required this.index,
    required this.type,
  });

  TierListMinisModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    type = TypeTierList.values.elementAt(json['type']);
  }

  late int index;
  late TypeTierList type;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['type'] = type.index;
    return data;
  }
}
