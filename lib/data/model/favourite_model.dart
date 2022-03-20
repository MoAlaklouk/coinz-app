class FavouritesModel {
  Status? status;
  Pagination? pagination;
  List<Favourites>? favourites;

  FavouritesModel({this.status, this.pagination, this.favourites});

  FavouritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['favourites'] != null) {
      favourites = <Favourites>[];
      json['favourites'].forEach((v) {
        favourites!.add(Favourites.fromJson(v));
      });
    }
  }
}

class Status {
  bool? success;
  int? code;
  String? message;

  Status({this.success, this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
  }
}

class Pagination {
  int? iTotalObjects;
  int? iItemsOnPage;
  int? iPerPages;
  int? iCurrentPage;
  int? iTotalPages;

  Pagination(
      {this.iTotalObjects,
      this.iItemsOnPage,
      this.iPerPages,
      this.iCurrentPage,
      this.iTotalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    iTotalObjects = json['i_total_objects'];
    iItemsOnPage = json['i_items_on_page'];
    iPerPages = json['i_per_pages'];
    iCurrentPage = json['i_current_page'];
    iTotalPages = json['i_total_pages'];
  }
}

class Favourites {
  int? pkIId;
  String? sCode;
  String? sName;
  String? dValue;
  String? dTrading;
  String? sIcon;
  bool? bEnabled;
  String? dtCreatedDate;
  String? dtModifiedDate;
  Null? dtDeletedDate;

  Favourites(
      {this.pkIId,
      this.sCode,
      this.sName,
      this.dValue,
      this.dTrading,
      this.sIcon,
      this.bEnabled,
      this.dtCreatedDate,
      this.dtModifiedDate,
      this.dtDeletedDate});

  Favourites.fromJson(Map<String, dynamic> json) {
    pkIId = json['pk_i_id'];
    sCode = json['s_code'];
    sName = json['s_name'];
    dValue = json['d_value'];
    dTrading = json['d_trading'];
    sIcon = json['s_icon'];
    bEnabled = json['b_enabled'];
    dtCreatedDate = json['dt_created_date'];
    dtModifiedDate = json['dt_modified_date'];
    dtDeletedDate = json['dt_deleted_date'];
  }
}

class Add {
  Status? status;

  Add({this.status});

  Add.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }
}

class StatusAdd {
  bool? success;
  int? code;
  String? message;

  StatusAdd({this.success, this.code, this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
