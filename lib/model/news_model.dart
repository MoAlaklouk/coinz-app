class NewsModel {
  Status? status;
  Pagination? pagination;
  List<News>? news;

  NewsModel({this.status, this.pagination, this.news});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
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

class News {
  int? pkIId;
  String? sTitle;
  String? sImage;
  String? sDescription;
  bool? bEnabled;
  String? dtCreatedDate;
  String? dtModifiedDate;
  Null? dtDeletedDate;

  News(
      {this.pkIId,
      this.sTitle,
      this.sImage,
      this.sDescription,
      this.bEnabled,
      this.dtCreatedDate,
      this.dtModifiedDate,
      this.dtDeletedDate});

  News.fromJson(Map<String, dynamic> json) {
    pkIId = json['pk_i_id'];
    sTitle = json['s_title'];
    sImage = json['s_image'];
    sDescription = json['s_description'];
    bEnabled = json['b_enabled'];
    dtCreatedDate = json['dt_created_date'];
    dtModifiedDate = json['dt_modified_date'];
    dtDeletedDate = json['dt_deleted_date'];
  }
}
