import 'dart:convert';

import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/model/politic_question.m.dart';
import 'package:aconnec_1109_x/src/model/politic_question.m.p.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_prefill.m.dart';
import 'package:aconnec_1109_x/src/model/district.m.dart';
import 'package:aconnec_1109_x/src/model/district.m.p.dart';
import 'package:aconnec_1109_x/src/model/knowledge.m.dart';
import 'package:aconnec_1109_x/src/model/knowledge.m.p.dart';
import 'package:aconnec_1109_x/src/model/occupation.m.dart';
import 'package:aconnec_1109_x/src/model/occupations.m.p.dart';
import 'package:aconnec_1109_x/src/model/post_code.m.dart';
import 'package:aconnec_1109_x/src/model/post_code.m.p.dart';
import 'package:aconnec_1109_x/src/model/province.m.dart';
import 'package:aconnec_1109_x/src/model/province.m.p.dart';
import 'package:aconnec_1109_x/src/model/sub_district.m.dart';
import 'package:aconnec_1109_x/src/model/sub_district.m.p.dart';
import 'package:aconnec_1109_x/src/model/suiteable_question.m.dart';
import 'package:aconnec_1109_x/src/model/suiteable_question.m.p.dart';

import '../../model/network.m.dart';

class JsonData {
  JsonData._();

  static Future<List<ProvinceModel>> loadProvinces() async {
    var jsonText = await rootBundle.loadString(AssetJson.provinces);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<ProvinceModel> provinces =
        ProvinceModelPersistence().fromArrayJson(list);
    return provinces;
  }

  static Future<List<DistrictModel>> loadDistricts() async {
    var jsonText = await rootBundle.loadString(AssetJson.districts);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<DistrictModel> districts =
        DistrictsModelPersistence().fromArrayJson(list);
    return districts;
  }

  static Future<List<SubDistrictModel>> loadSubDistricts() async {
    var jsonText = await rootBundle.loadString(AssetJson.subDistricts);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<SubDistrictModel> subDistricts =
        SubDistrictModelPersistence().fromArrayJson(list);
    return subDistricts;
  }

  static Future<List<PostCodeModel>> loadPostCodes() async {
    var jsonText = await rootBundle.loadString(AssetJson.postCodes);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<PostCodeModel> postCodes =
        PostCodeModelPersistence().fromArrayJson(list);
    return postCodes;
  }

  static Future<List<OccupationModel>> loadOccupations() async {
    var jsonText = await rootBundle.loadString(AssetJson.occupations);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<OccupationModel> occupations =
        OccupationModelPersistence().fromArrayJson(list);
    return occupations;
  }

  static Future<List<SuiteableQuestionModel>> loadSuiteableQuestions() async {
    try {
      var jsonText = await rootBundle.loadString(AssetJson.suiteableQuestions);
      List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
      list = list
          .map(
            (e) => Map<String, dynamic>.from(e),
          )
          .toList();
      List<SuiteableQuestionModel> questions =
          SuiteableQuestionModelPersistence().fromArrayJson(list);
      return questions;
    } catch (e) {
      return [];
    }
  }

  static Future<KnowledgeModel> loadKnowledgeQuestions() async {
    var jsonText =
        await rootBundle.loadString(Assets.json.knowledgeQuestions2Q);
    Map<String, dynamic> json = Map<String, dynamic>.from(jsonDecode(jsonText));
    KnowledgeModel knowledge = KnowledgeModelPersistence().fromJson(json);

    return knowledge;
  }

  static Future<List<SuiteablePrefillModel>> loadSuiteablePrefills() async {
    var jsonText = await rootBundle.loadString(AssetJson.suiteablePrefill);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<SuiteablePrefillModel> prefills =
        SuiteablePrefillModelPersistence().fromArrayJson(list);
    return prefills;
  }

  static Future<List<PoliticQuestionModel>> loadPoliticQuestions() async {
    try {
      var jsonText = await rootBundle.loadString(Assets.json.politicQuestions);
      List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
      list = list
          .map(
            (e) => Map<String, dynamic>.from(e),
          )
          .toList();
      List<PoliticQuestionModel> questions =
          PoliticQuestionModelPersistence().fromArrayJson(list);
      return questions;
    } catch (e) {
      return [];
    }
  }

  static Future<List<NetworkModel>> loadNetwork() async {
    var jsonText = await rootBundle.loadString(Assets.json.network);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<NetworkModel> provinces =
        NetworkModelPersistence().fromArrayJson(list);
    return provinces;
  }

  static Future<List<OccupationGroupModel>> loadOccupationGroup() async {
    var jsonText = await rootBundle.loadString(Assets.json.occuationGroup);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<OccupationGroupModel> groups =
        OccupationGroupModelPersistence().fromArrayJson(list);
    return groups;
  }

  static Future<List<OccupationListItemModel>> loadOccupationListItems() async {
    var jsonText = await rootBundle.loadString(Assets.json.occupationList);
    List<dynamic> list = jsonDecode(jsonText) as List<dynamic>;
    list = list
        .map(
          (e) => Map<String, dynamic>.from(e),
        )
        .toList();
    List<OccupationListItemModel> items =
        OccupationListItemModelPersistence().fromArrayJson(list);
    return items;
  }
}
