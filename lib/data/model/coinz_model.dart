class CurrenciesModel {
  Status? status;
  Pagination? pagination;
  List<Currencies>? currencies;

  CurrenciesModel({this.status, this.pagination, this.currencies});

  CurrenciesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currencies.fromJson(v));
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

class Currencies {
  int? pkIId;
  String? sCode;
  String? sName;
  String? dValue;
  String? dTrading;
  String? sIcon;
  bool? bEnabled;
  String? dtCreatedDate;
  String? dtModifiedDate;
  String? dtDeletedDate;

  Currencies(
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

  Currencies.fromJson(Map<String, dynamic> json) {
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
