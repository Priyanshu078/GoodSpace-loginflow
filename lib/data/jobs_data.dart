class JobsData {
  List<Data>? data;
  double? status;

  JobsData({data, status});

  JobsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    data['status'] = status;
    return data;
  }
}

class Data {
  String? type;
  CardData? cardData;

  Data({type, cardData});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    cardData =
        json['cardData'] != null ? CardData.fromJson(json['cardData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (cardData != null) {
      data['cardData'] = cardData!.toJson();
    }
    return data;
  }
}

class CardData {
  double? showOrganisation;
  double? offerId;
  double? userId;
  String? companyName;
  double? offerTypeId;
  String? description;
  String? url;
  double? lowerworkex;
  double? upperworkex;
  String? monthlyCompensation;
  String? hourlyCompensation;
  double? monthlyCompensationId;
  String? hourlyCompensationId;
  double? isRemote;
  String? redirectUrl;
  String? minScore;
  String? minAge;
  String? maxAge;
  String? locationCity;
  double? distance;
  double? isOrganic;
  String? title;
  String? industryTypeId;
  String? industryType;
  double? jobFunctionId;
  double? designationId;
  String? designation;
  String? date;
  bool? hasApplied;
  bool? needToRedirect;
  bool? jobSaved;
  bool? isBusinessOpportunity;
  bool? showRelocateModal;
  List<Skills>? skills;
  List<JobType>? jobType;
  String? displayCompensation;
  String? relativeTime;
  String? postedAtRelative;
  bool? hasLiked;
  UserInfo? userInfo;

  CardData(
      {showOrganisation,
      offerId,
      userId,
      companyName,
      offerTypeId,
      description,
      url,
      lowerworkex,
      upperworkex,
      monthlyCompensation,
      hourlyCompensation,
      monthlyCompensationId,
      hourlyCompensationId,
      isRemote,
      redirectUrl,
      minScore,
      minAge,
      maxAge,
      locationCity,
      distance,
      isOrganic,
      title,
      industryTypeId,
      industryType,
      jobFunctionId,
      designationId,
      designation,
      date,
      hasApplied,
      needToRedirect,
      jobSaved,
      isBusinessOpportunity,
      showRelocateModal,
      skills,
      jobType,
      displayCompensation,
      relativeTime,
      postedAtRelative,
      hasLiked,
      userInfo});

  CardData.fromJson(Map<String, dynamic> json) {
    showOrganisation = json['showOrganisation'];
    offerId = json['offerId'];
    userId = json['userId'];
    companyName = json['companyName'];
    offerTypeId = json['offerTypeId'];
    description = json['description'];
    url = json['url'];
    lowerworkex = json['lowerworkex'];
    upperworkex = json['upperworkex'];
    monthlyCompensation = json['monthly_compensation'];
    hourlyCompensation = json['hourly_compensation'];
    monthlyCompensationId = json['monthly_compensation_id'];
    hourlyCompensationId = json['hourly_compensation_id'];
    isRemote = json['is_remote'];
    redirectUrl = json['redirectUrl'];
    minScore = json['minScore'];
    minAge = json['minAge'];
    maxAge = json['maxAge'];
    locationCity = json['location_city'];
    distance = json['distance'];
    isOrganic = json['is_organic'];
    title = json['title'];
    industryTypeId = json['industry_type_id'];
    industryType = json['industry_type'];
    jobFunctionId = json['job_function_id'];
    designationId = json['designation_id'];
    designation = json['designation'];
    date = json['date'];
    hasApplied = json['hasApplied'];
    needToRedirect = json['needToRedirect'];
    jobSaved = json['jobSaved'];
    isBusinessOpportunity = json['isBusinessOpportunity'];
    showRelocateModal = json['showRelocateModal'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
    if (json['jobType'] != null) {
      jobType = <JobType>[];
      json['jobType'].forEach((v) {
        jobType!.add(JobType.fromJson(v));
      });
    }
    displayCompensation = json['displayCompensation'];
    relativeTime = json['relativeTime'];
    postedAtRelative = json['postedAtRelative'];
    hasLiked = json['hasLiked'];
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['showOrganisation'] = showOrganisation;
    data['offerId'] = offerId;
    data['userId'] = userId;
    data['companyName'] = companyName;
    data['offerTypeId'] = offerTypeId;
    data['description'] = description;
    data['url'] = url;
    data['lowerworkex'] = lowerworkex;
    data['upperworkex'] = upperworkex;
    data['monthly_compensation'] = monthlyCompensation;
    data['hourly_compensation'] = hourlyCompensation;
    data['monthly_compensation_id'] = monthlyCompensationId;
    data['hourly_compensation_id'] = hourlyCompensationId;
    data['is_remote'] = isRemote;
    data['redirectUrl'] = redirectUrl;
    data['minScore'] = minScore;
    data['minAge'] = minAge;
    data['maxAge'] = maxAge;
    data['location_city'] = locationCity;
    data['distance'] = distance;
    data['is_organic'] = isOrganic;
    data['title'] = title;
    data['industry_type_id'] = industryTypeId;
    data['industry_type'] = industryType;
    data['job_function_id'] = jobFunctionId;
    data['designation_id'] = designationId;
    data['designation'] = designation;
    data['date'] = date;
    data['hasApplied'] = hasApplied;
    data['needToRedirect'] = needToRedirect;
    data['jobSaved'] = jobSaved;
    data['isBusinessOpportunity'] = isBusinessOpportunity;
    data['showRelocateModal'] = showRelocateModal;
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (jobType != null) {
      data['jobType'] = jobType!.map((v) => v.toJson()).toList();
    }
    data['displayCompensation'] = displayCompensation;
    data['relativeTime'] = relativeTime;
    data['postedAtRelative'] = postedAtRelative;
    data['hasLiked'] = hasLiked;
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    return data;
  }
}

class Skills {
  double? offerId;
  double? skillId;
  String? skill;

  Skills({offerId, skillId, skill});

  Skills.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    skillId = json['skill_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offerId'] = offerId;
    data['skill_id'] = skillId;
    data['skill'] = skill;
    return data;
  }
}

class JobType {
  double? offerId;
  double? jobTypeId;
  String? jobType;

  JobType({offerId, jobTypeId, jobType});

  JobType.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    jobTypeId = json['job_type_id'];
    jobType = json['job_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offerId'] = offerId;
    data['job_type_id'] = jobTypeId;
    data['job_type'] = jobType;
    return data;
  }
}

class UserInfo {
  double? userId;
  String? name;
  String? imageId;
  double? score;
  bool? isProfileVerified;

  UserInfo({userId, name, imageId, score, isProfileVerified});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    imageId = json['image_id'];
    score = json['score'];
    isProfileVerified = json['isProfileVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['image_id'] = imageId;
    data['score'] = score;
    data['isProfileVerified'] = isProfileVerified;
    return data;
  }
}
