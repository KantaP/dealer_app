// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `และ`
  String get and {
    return Intl.message(
      'และ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `ข้าม`
  String get skip {
    return Intl.message(
      'ข้าม',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `ถัดไป`
  String get nextButton {
    return Intl.message(
      'ถัดไป',
      name: 'nextButton',
      desc: '',
      args: [],
    );
  }

  /// `ย้อนกลับ`
  String get backButton {
    return Intl.message(
      'ย้อนกลับ',
      name: 'backButton',
      desc: '',
      args: [],
    );
  }

  /// `ค้นหา`
  String get searchPlaceholder {
    return Intl.message(
      'ค้นหา',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `ใช่`
  String get yes {
    return Intl.message(
      'ใช่',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `ไม่ใช่`
  String get no {
    return Intl.message(
      'ไม่ใช่',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `มี`
  String get have {
    return Intl.message(
      'มี',
      name: 'have',
      desc: '',
      args: [],
    );
  }

  /// `ไม่มี`
  String get doNotHave {
    return Intl.message(
      'ไม่มี',
      name: 'doNotHave',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get buttonStart {
    return Intl.message(
      '====================================================================',
      name: 'buttonStart',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submitButton {
    return Intl.message(
      'Submit',
      name: 'submitButton',
      desc: '',
      args: [],
    );
  }

  /// `ตกลง`
  String get textDialogSubmitButton {
    return Intl.message(
      'ตกลง',
      name: 'textDialogSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกการทำรายการ`
  String get paymentCancellationButton {
    return Intl.message(
      'ยกเลิกการทำรายการ',
      name: 'paymentCancellationButton',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิก`
  String get cancelButton {
    return Intl.message(
      'ยกเลิก',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `ชำระอีกครั้ง`
  String get paymentTryAgainButton {
    return Intl.message(
      'ชำระอีกครั้ง',
      name: 'paymentTryAgainButton',
      desc: '',
      args: [],
    );
  }

  /// `ยอมรับ`
  String get acceptButton {
    return Intl.message(
      'ยอมรับ',
      name: 'acceptButton',
      desc: '',
      args: [],
    );
  }

  /// `ปฎิเสธ`
  String get rejectButton {
    return Intl.message(
      'ปฎิเสธ',
      name: 'rejectButton',
      desc: '',
      args: [],
    );
  }

  /// `แชร์สลิป`
  String get shareSlipButton {
    return Intl.message(
      'แชร์สลิป',
      name: 'shareSlipButton',
      desc: '',
      args: [],
    );
  }

  /// `บันทึกสลิป`
  String get saveSlipButton {
    return Intl.message(
      'บันทึกสลิป',
      name: 'saveSlipButton',
      desc: '',
      args: [],
    );
  }

  /// `แก้ไข`
  String get editButton {
    return Intl.message(
      'แก้ไข',
      name: 'editButton',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยัน`
  String get confirmButton {
    return Intl.message(
      'ยืนยัน',
      name: 'confirmButton',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกและเปลี่ยนผู้ให้บริการยืนยันตัวตน`
  String get kycNdidCancelButton {
    return Intl.message(
      'ยกเลิกและเปลี่ยนผู้ให้บริการยืนยันตัวตน',
      name: 'kycNdidCancelButton',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกการยืนยันตัวตน`
  String get kycNdidCancel2ndButton {
    return Intl.message(
      'ยกเลิกการยืนยันตัวตน',
      name: 'kycNdidCancel2ndButton',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตนช่องทางแอปพลิเคชันอีกครั้ง`
  String get kycNdidAgainButton {
    return Intl.message(
      'ยืนยันตัวตนช่องทางแอปพลิเคชันอีกครั้ง',
      name: 'kycNdidAgainButton',
      desc: '',
      args: [],
    );
  }

  /// `ตั้งค่า pin`
  String get setpinButton {
    return Intl.message(
      'ตั้งค่า pin',
      name: 'setpinButton',
      desc: '',
      args: [],
    );
  }

  /// `กลับสู่หน้าหลัก`
  String get backtoHomeButton {
    return Intl.message(
      'กลับสู่หน้าหลัก',
      name: 'backtoHomeButton',
      desc: '',
      args: [],
    );
  }

  /// `เลือก`
  String get selectButton {
    return Intl.message(
      'เลือก',
      name: 'selectButton',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottomMenuHomeButton {
    return Intl.message(
      'Home',
      name: 'bottomMenuHomeButton',
      desc: '',
      args: [],
    );
  }

  /// `Scan & Pay`
  String get bottomMenuScanPayButton {
    return Intl.message(
      'Scan & Pay',
      name: 'bottomMenuScanPayButton',
      desc: '',
      args: [],
    );
  }

  /// `Convert Point`
  String get bottomMenuConvertButton {
    return Intl.message(
      'Convert Point',
      name: 'bottomMenuConvertButton',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get bottomMenuWalletButton {
    return Intl.message(
      'Wallet',
      name: 'bottomMenuWalletButton',
      desc: '',
      args: [],
    );
  }

  /// `Notificaiton`
  String get bottomMenuNotificationButton {
    return Intl.message(
      'Notificaiton',
      name: 'bottomMenuNotificationButton',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buyGasthButton {
    return Intl.message(
      'Buy',
      name: 'buyGasthButton',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get sellGasthButton {
    return Intl.message(
      'Sell',
      name: 'sellGasthButton',
      desc: '',
      args: [],
    );
  }

  /// `Add Verify Bank Account`
  String get addBankButton {
    return Intl.message(
      'Add Verify Bank Account',
      name: 'addBankButton',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกการทำรายการ`
  String get cancelOrderButton {
    return Intl.message(
      'ยกเลิกการทำรายการ',
      name: 'cancelOrderButton',
      desc: '',
      args: [],
    );
  }

  /// `View Transaction History`
  String get viewHistoryButton {
    return Intl.message(
      'View Transaction History',
      name: 'viewHistoryButton',
      desc: '',
      args: [],
    );
  }

  /// `Buy Again`
  String get buyAgainButton {
    return Intl.message(
      'Buy Again',
      name: 'buyAgainButton',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contactSupportButton {
    return Intl.message(
      'Contact Support',
      name: 'contactSupportButton',
      desc: '',
      args: [],
    );
  }

  /// `ถัดไป`
  String get continueButton {
    return Intl.message(
      'ถัดไป',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `ตกลง`
  String get okButton {
    return Intl.message(
      'ตกลง',
      name: 'okButton',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน`
  String get gotoKycButton {
    return Intl.message(
      'ยืนยันตัวตน',
      name: 'gotoKycButton',
      desc: '',
      args: [],
    );
  }

  /// `ไม่ใช่ตอนนี้`
  String get laterButton {
    return Intl.message(
      'ไม่ใช่ตอนนี้',
      name: 'laterButton',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get buttonEnd {
    return Intl.message(
      '====================================================================',
      name: 'buttonEnd',
      desc: '',
      args: [],
    );
  }

  /// `THB`
  String get thb {
    return Intl.message(
      'THB',
      name: 'thb',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Id`
  String get transactionId {
    return Intl.message(
      'Transaction Id',
      name: 'transactionId',
      desc: '',
      args: [],
    );
  }

  /// `GASTH amount`
  String get gasthAmount {
    return Intl.message(
      'GASTH amount',
      name: 'gasthAmount',
      desc: '',
      args: [],
    );
  }

  /// `GASTA Voucher`
  String get gastaVoucher {
    return Intl.message(
      'GASTA Voucher',
      name: 'gastaVoucher',
      desc: '',
      args: [],
    );
  }

  /// `ใช้ส่วนลด %numOfVoucher% รายการ`
  String get useVoucher {
    return Intl.message(
      'ใช้ส่วนลด %numOfVoucher% รายการ',
      name: 'useVoucher',
      desc: '',
      args: [],
    );
  }

  /// `รอการชำระเงิน`
  String get orderPendingStatus {
    return Intl.message(
      'รอการชำระเงิน',
      name: 'orderPendingStatus',
      desc: '',
      args: [],
    );
  }

  /// `ชำระเงินสำเร็จ`
  String get orderCompledtedStatus {
    return Intl.message(
      'ชำระเงินสำเร็จ',
      name: 'orderCompledtedStatus',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกรายการ`
  String get orderCancelStatus {
    return Intl.message(
      'ยกเลิกรายการ',
      name: 'orderCancelStatus',
      desc: '',
      args: [],
    );
  }

  /// `รายการไม่สำเร็จ`
  String get orderIncompleteStatus {
    return Intl.message(
      'รายการไม่สำเร็จ',
      name: 'orderIncompleteStatus',
      desc: '',
      args: [],
    );
  }

  /// `โอนเหรียญสำเร็จ`
  String get orderTransferCoinCompletedStatus {
    return Intl.message(
      'โอนเหรียญสำเร็จ',
      name: 'orderTransferCoinCompletedStatus',
      desc: '',
      args: [],
    );
  }

  /// `ท่านต้องการยกเลิกรายการใช่หรือไม่`
  String get orderCancelDialogTitle {
    return Intl.message(
      'ท่านต้องการยกเลิกรายการใช่หรือไม่',
      name: 'orderCancelDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save image success`
  String get saveSlipSuccess {
    return Intl.message(
      'Save image success',
      name: 'saveSlipSuccess',
      desc: '',
      args: [],
    );
  }

  /// `ชั่วโมง`
  String get hour {
    return Intl.message(
      'ชั่วโมง',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `นาที`
  String get minute {
    return Intl.message(
      'นาที',
      name: 'minute',
      desc: '',
      args: [],
    );
  }

  /// `วินาที`
  String get second {
    return Intl.message(
      'วินาที',
      name: 'second',
      desc: '',
      args: [],
    );
  }

  /// `KYC Level`
  String get kycLevel {
    return Intl.message(
      'KYC Level',
      name: 'kycLevel',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `คุณยังไม่มีรางวัลในขณะนี้`
  String get no_reward {
    return Intl.message(
      'คุณยังไม่มีรางวัลในขณะนี้',
      name: 'no_reward',
      desc: '',
      args: [],
    );
  }

  /// `GASTH`
  String get gasth {
    return Intl.message(
      'GASTH',
      name: 'gasth',
      desc: '',
      args: [],
    );
  }

  /// `ธนาคาร`
  String get bankName {
    return Intl.message(
      'ธนาคาร',
      name: 'bankName',
      desc: '',
      args: [],
    );
  }

  /// `เลขบัญชี`
  String get bankNumber {
    return Intl.message(
      'เลขบัญชี',
      name: 'bankNumber',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อบัญชี`
  String get bankAccountName {
    return Intl.message(
      'ชื่อบัญชี',
      name: 'bankAccountName',
      desc: '',
      args: [],
    );
  }

  /// `ไม่พบชื่อธนาคาร`
  String get emptyBankName {
    return Intl.message(
      'ไม่พบชื่อธนาคาร',
      name: 'emptyBankName',
      desc: '',
      args: [],
    );
  }

  /// `ทั้งหมด`
  String get all {
    return Intl.message(
      'ทั้งหมด',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `คริปโต`
  String get crypto {
    return Intl.message(
      'คริปโต',
      name: 'crypto',
      desc: '',
      args: [],
    );
  }

  /// `โทเคน`
  String get token {
    return Intl.message(
      'โทเคน',
      name: 'token',
      desc: '',
      args: [],
    );
  }

  /// `มาใหม่`
  String get newListing {
    return Intl.message(
      'มาใหม่',
      name: 'newListing',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use for 1109x app`
  String get termsAConnectApp {
    return Intl.message(
      'Terms of Use for 1109x app',
      name: 'termsAConnectApp',
      desc: '',
      args: [],
    );
  }

  /// `ข้อตกลงการให้บริการ`
  String get termsAndConditions {
    return Intl.message(
      'ข้อตกลงการให้บริการ',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `ยินยอม`
  String get accept {
    return Intl.message(
      'ยินยอม',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `ไม่ยินยอม`
  String get doNotAccept {
    return Intl.message(
      'ไม่ยินยอม',
      name: 'doNotAccept',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get bankNameStart {
    return Intl.message(
      '====================================================================',
      name: 'bankNameStart',
      desc: '',
      args: [],
    );
  }

  /// `ธนาคารไทยพาณิชย์`
  String get scb {
    return Intl.message(
      'ธนาคารไทยพาณิชย์',
      name: 'scb',
      desc: '',
      args: [],
    );
  }

  /// `ธนาคารกสิกรไทย`
  String get ktb {
    return Intl.message(
      'ธนาคารกสิกรไทย',
      name: 'ktb',
      desc: '',
      args: [],
    );
  }

  /// `ธนาคารกรุงไทย`
  String get ktc {
    return Intl.message(
      'ธนาคารกรุงไทย',
      name: 'ktc',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get bankNameEnd {
    return Intl.message(
      '====================================================================',
      name: 'bankNameEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get ndidErrorFinalStart {
    return Intl.message(
      '====================================================================',
      name: 'ndidErrorFinalStart',
      desc: '',
      args: [],
    );
  }

  /// `ระบบจะทําการคืนค่าธรรมเนียมเป็น voucher ทันทีมีทางเลือก ในการคืน`
  String get ndidErrorFinalDesc1 {
    return Intl.message(
      'ระบบจะทําการคืนค่าธรรมเนียมเป็น voucher ทันทีมีทางเลือก ในการคืน',
      name: 'ndidErrorFinalDesc1',
      desc: '',
      args: [],
    );
  }

  /// `1.Cash โอนเข้าบัญชีภายใน 15 วันทําการ`
  String get ndidErrorFinalDesc2 {
    return Intl.message(
      '1.Cash โอนเข้าบัญชีภายใน 15 วันทําการ',
      name: 'ndidErrorFinalDesc2',
      desc: '',
      args: [],
    );
  }

  /// `2.GASTH Token (คํานวณ rate ณ วันที่กดใช้ voucher)`
  String get ndidErrorFinalDesc3 {
    return Intl.message(
      '2.GASTH Token (คํานวณ rate ณ วันที่กดใช้ voucher)',
      name: 'ndidErrorFinalDesc3',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาตรวจสอบที่ My Voucher`
  String get ndidErrorFinalDesc4 {
    return Intl.message(
      'กรุณาตรวจสอบที่ My Voucher',
      name: 'ndidErrorFinalDesc4',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get ndidERrorFinalEnd {
    return Intl.message(
      '====================================================================',
      name: 'ndidERrorFinalEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get ndidErrorCodeStart {
    return Intl.message(
      '====================================================================',
      name: 'ndidErrorCodeStart',
      desc: '',
      args: [],
    );
  }

  /// `ผู้ให้บริการยืนยันตัวตนที่ท่านเลือกไม่สามารถให้บริการได้ในขณะนี้ กรุณาทำรายการใหม่หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidErrorCode30000 {
    return Intl.message(
      'ผู้ให้บริการยืนยันตัวตนที่ท่านเลือกไม่สามารถให้บริการได้ในขณะนี้ กรุณาทำรายการใหม่หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidErrorCode30000',
      desc: '',
      args: [],
    );
  }

  /// `ไม่สามารถทำรายการได้ในขณะนี้ กรุณาตรวจสอบเลขบัตร ประชาชนของท่านและทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยัน ตัวตนรายอื่น`
  String get ndidErrorCode30200 {
    return Intl.message(
      'ไม่สามารถทำรายการได้ในขณะนี้ กรุณาตรวจสอบเลขบัตร ประชาชนของท่านและทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยัน ตัวตนรายอื่น',
      name: 'ndidErrorCode30200',
      desc: '',
      args: [],
    );
  }

  /// `ไม่พบข้อมูลของท่านในฐานข้อมูลผู้ใช้บริการของผู้ให้บริการยืนยัน ตัวตนที่ท่านเลือก กรุณาเลือกผู้ให้บริการยืนยันตัวตนรายอื่นที่ท่าน เคยลงทะเบียนและมีโมบายแอปพลิเคชัน`
  String get ndidErrorCode30300 {
    return Intl.message(
      'ไม่พบข้อมูลของท่านในฐานข้อมูลผู้ใช้บริการของผู้ให้บริการยืนยัน ตัวตนที่ท่านเลือก กรุณาเลือกผู้ให้บริการยืนยันตัวตนรายอื่นที่ท่าน เคยลงทะเบียนและมีโมบายแอปพลิเคชัน',
      name: 'ndidErrorCode30300',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย ข้อมูลของท่านไม่เป็นปัจจุบัน กรุณาติดต่อผู้ให้บริการ ยืนยันตัวตนที่ท่านเลือกเพื่ออัปเดทข้อมูล หรือเลือกผู้ให้บริการยืนยัน ตัวตนรายอื่น`
  String get ndidErrorCode30400 {
    return Intl.message(
      'ขออภัย ข้อมูลของท่านไม่เป็นปัจจุบัน กรุณาติดต่อผู้ให้บริการ ยืนยันตัวตนที่ท่านเลือกเพื่ออัปเดทข้อมูล หรือเลือกผู้ให้บริการยืนยัน ตัวตนรายอื่น',
      name: 'ndidErrorCode30400',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านระบุ PIN ผิด, ภาพถ่ายไม่ชัดเจน กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidErrorCode30500 {
    return Intl.message(
      'การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านระบุ PIN ผิด, ภาพถ่ายไม่ชัดเจน กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidErrorCode30500',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านระบุ PIN/Password ไม่ถูกต้อง กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidErrorCode30510 {
    return Intl.message(
      'การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านระบุ PIN/Password ไม่ถูกต้อง กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidErrorCode30510',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านยืนยันตัวตนด้วยระบบจดจำ ใบหน้า (Face Recognition) ไม่ผ่านตามเงื่อนไขที่กำหนด กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น”`
  String get ndidErrorCode30520 {
    return Intl.message(
      'การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านยืนยันตัวตนด้วยระบบจดจำ ใบหน้า (Face Recognition) ไม่ผ่านตามเงื่อนไขที่กำหนด กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น”',
      name: 'ndidErrorCode30520',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านระบุรหัส OTP ไม่ถูกต้อง กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidErrorCode30530 {
    return Intl.message(
      'การยืนยันตัวตนไม่สำเร็จเนื่องจากท่านระบุรหัส OTP ไม่ถูกต้อง กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidErrorCode30530',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนไม่สำเร็จ เนื่องจากท่านได้ยกเลิกรายการยืนยัน ตัวตนที่โมบายแอปพลิเคชันของผู้ให้บริการยืนยันตัวตน กรุณาเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidErrorCode30600 {
    return Intl.message(
      'การยืนยันตัวตนไม่สำเร็จ เนื่องจากท่านได้ยกเลิกรายการยืนยัน ตัวตนที่โมบายแอปพลิเคชันของผู้ให้บริการยืนยันตัวตน กรุณาเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidErrorCode30600',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนไม่สำเร็จ เนื่องจากท่านไม่ได้ยอมรับเงื่อนไขการ ให้บริการยืนยันตัวตนของผู้ให้บริการยืนยันตัวตนที่ท่านเลือก กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น”`
  String get ndidErrorCode30610 {
    return Intl.message(
      'การยืนยันตัวตนไม่สำเร็จ เนื่องจากท่านไม่ได้ยอมรับเงื่อนไขการ ให้บริการยืนยันตัวตนของผู้ให้บริการยืนยันตัวตนที่ท่านเลือก กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น”',
      name: 'ndidErrorCode30610',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนไม่สำเร็จ เนื่องจากผู้ให้บริการยืนยันตัวตนที่ท่าน เลือกไม่สามารถให้บริการได้ในขณะนี้ กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidErrorCode30700 {
    return Intl.message(
      'การยืนยันตัวตนไม่สำเร็จ เนื่องจากผู้ให้บริการยืนยันตัวตนที่ท่าน เลือกไม่สามารถให้บริการได้ในขณะนี้ กรุณาทำรายการใหม่ หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidErrorCode30700',
      desc: '',
      args: [],
    );
  }

  /// `ท่านยังไม่ได้ลงทะเบียนและยอมรับเงื่อนไขการใช้บริการ NDID ที่โมบายแอปพลิเคชัน ของผู้ให้บริการยืนยันตัวตน กรุณาดำเนินการก่อนทำรายการ`
  String get ndidErrorCode30800 {
    return Intl.message(
      'ท่านยังไม่ได้ลงทะเบียนและยอมรับเงื่อนไขการใช้บริการ NDID ที่โมบายแอปพลิเคชัน ของผู้ให้บริการยืนยันตัวตน กรุณาดำเนินการก่อนทำรายการ',
      name: 'ndidErrorCode30800',
      desc: '',
      args: [],
    );
  }

  /// `ไม่สามารถทำรายการได้ในขณะนี้ เนื่องจากอยู่นอกเวลาการให้บริการของ [idp] กรุณาเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidErrorCode30900 {
    return Intl.message(
      'ไม่สามารถทำรายการได้ในขณะนี้ เนื่องจากอยู่นอกเวลาการให้บริการของ [idp] กรุณาเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidErrorCode30900',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย ท่านไม่สามารถทำรายการได้ในขณะนี้ กรุณาทำรายการใหม่ หรือติดต่อ Customer support support@1109x.net`
  String get ndidErrorCode40000 {
    return Intl.message(
      'ขออภัย ท่านไม่สามารถทำรายการได้ในขณะนี้ กรุณาทำรายการใหม่ หรือติดต่อ Customer support support@1109x.net',
      name: 'ndidErrorCode40000',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย ไม่สามารถดำเนินการต่อได้เนื่องจากท่านใส่เลขบัตรประชาชนไม่ถูกต้อง กรุณาทำรายการใหม่อีกครั้ง`
  String get ndidErrorCode40200 {
    return Intl.message(
      'ขออภัย ไม่สามารถดำเนินการต่อได้เนื่องจากท่านใส่เลขบัตรประชาชนไม่ถูกต้อง กรุณาทำรายการใหม่อีกครั้ง',
      name: 'ndidErrorCode40200',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย ไม่สามารถดำเนินการต่อได้ กรุณาติดต่อ Customer support support@1109x.net`
  String get ndidErrorCode40300 {
    return Intl.message(
      'ขออภัย ไม่สามารถดำเนินการต่อได้ กรุณาติดต่อ Customer support support@1109x.net',
      name: 'ndidErrorCode40300',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย ไม่สามารถดำเนินการต่อได้เนื่องจากข้อมูลไม่ถูกต้อง กรุณาทำรายการใหม่อีกครั้ง หรือติดต่อ Customer support support@1109x.net%`
  String get ndidErrorCode40400 {
    return Intl.message(
      'ขออภัย ไม่สามารถดำเนินการต่อได้เนื่องจากข้อมูลไม่ถูกต้อง กรุณาทำรายการใหม่อีกครั้ง หรือติดต่อ Customer support support@1109x.net%',
      name: 'ndidErrorCode40400',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย ไม่สามารถดำเนินการต่อได้ กรุณาติดต่อ Customer support support@1109x.net`
  String get ndidErrorCode40500 {
    return Intl.message(
      'ขออภัย ไม่สามารถดำเนินการต่อได้ กรุณาติดต่อ Customer support support@1109x.net',
      name: 'ndidErrorCode40500',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get ndidErrorCodeEnd {
    return Intl.message(
      '====================================================================',
      name: 'ndidErrorCodeEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get sideMenuStart {
    return Intl.message(
      '====================================================================',
      name: 'sideMenuStart',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settingMenu {
    return Intl.message(
      'Setting',
      name: 'settingMenu',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutMenu {
    return Intl.message(
      'Logout',
      name: 'logoutMenu',
      desc: '',
      args: [],
    );
  }

  /// `KYC`
  String get kycMenu {
    return Intl.message(
      'KYC',
      name: 'kycMenu',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get sideMenuEnd {
    return Intl.message(
      '====================================================================',
      name: 'sideMenuEnd',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get noticeDialogTitle {
    return Intl.message(
      'Notice',
      name: 'noticeDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get generalErrorStart {
    return Intl.message(
      '====================================================================',
      name: 'generalErrorStart',
      desc: '',
      args: [],
    );
  }

  /// `ท่านไม่สามารถใช้เลขบัตรประจำตัว\nประชาชนนี้ได้ เนื่องจากมีข้อมูลอยู่ใน\nระบบกับทางบริษัทฯ แล้ว\nกรุณาตรวจสอบข้อมูลอีกครั้ง\nหรือติดต่อเจ้าหน้าที่ 0661101109`
  String get idCardDuplicate {
    return Intl.message(
      'ท่านไม่สามารถใช้เลขบัตรประจำตัว\nประชาชนนี้ได้ เนื่องจากมีข้อมูลอยู่ใน\nระบบกับทางบริษัทฯ แล้ว\nกรุณาตรวจสอบข้อมูลอีกครั้ง\nหรือติดต่อเจ้าหน้าที่ 0661101109',
      name: 'idCardDuplicate',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get generalErrorEnd {
    return Intl.message(
      '====================================================================',
      name: 'generalErrorEnd',
      desc: '',
      args: [],
    );
  }

  /// `GASTH Balance`
  String get gasta_balance {
    return Intl.message(
      'GASTH Balance',
      name: 'gasta_balance',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get dealerStart {
    return Intl.message(
      '====================================================================',
      name: 'dealerStart',
      desc: '',
      args: [],
    );
  }

  /// `บริษัท 1109 พรอส์เปอร์ จำกัด`
  String get dealerAconnect {
    return Intl.message(
      'บริษัท 1109 พรอส์เปอร์ จำกัด',
      name: 'dealerAconnect',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get dealerEnd {
    return Intl.message(
      '====================================================================',
      name: 'dealerEnd',
      desc: '',
      args: [],
    );
  }

  /// `Terms of services`
  String get termsOfServices {
    return Intl.message(
      'Terms of services',
      name: 'termsOfServices',
      desc: '',
      args: [],
    );
  }

  /// `หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล`
  String get privacyPolicy {
    return Intl.message(
      'หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get setPinStart {
    return Intl.message(
      '====================================================================',
      name: 'setPinStart',
      desc: '',
      args: [],
    );
  }

  /// `ตั้งรหัส PIN`
  String get setPinTitle {
    return Intl.message(
      'ตั้งรหัส PIN',
      name: 'setPinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a PIN`
  String get setPinHeadline {
    return Intl.message(
      'Create a PIN',
      name: 'setPinHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Confirm a PIN`
  String get confirmPinHeadline {
    return Intl.message(
      'Confirm a PIN',
      name: 'confirmPinHeadline',
      desc: '',
      args: [],
    );
  }

  /// `To keep your funds secure, you will use this PIN to open your app`
  String get setPinContent {
    return Intl.message(
      'To keep your funds secure, you will use this PIN to open your app',
      name: 'setPinContent',
      desc: '',
      args: [],
    );
  }

  /// `For your security, Please confirm your PIN by typing again`
  String get confirmPinContent {
    return Intl.message(
      'For your security, Please confirm your PIN by typing again',
      name: 'confirmPinContent',
      desc: '',
      args: [],
    );
  }

  /// `Your PIN is not match, please try agian`
  String get setPinNotMatch {
    return Intl.message(
      'Your PIN is not match, please try agian',
      name: 'setPinNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Your PIN is not security, please try agian`
  String get setPinNotSecurity {
    return Intl.message(
      'Your PIN is not security, please try agian',
      name: 'setPinNotSecurity',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get setPinEnd {
    return Intl.message(
      '====================================================================',
      name: 'setPinEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get gettingStartedStart {
    return Intl.message(
      '====================================================================',
      name: 'gettingStartedStart',
      desc: '',
      args: [],
    );
  }

  /// `ซื้อขายด้วย %ความมั่นใจ%`
  String get gettingStartedInfoOneTitle {
    return Intl.message(
      'ซื้อขายด้วย %ความมั่นใจ%',
      name: 'gettingStartedInfoOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `1109x ได้รับอนุญาตให้เป็นผู้ค้าสินทรัพย์ดิจิทัล และอยู่ ภายใต้การกำกับดูแลของสำนักงานคณะกรรมการกำกับหลักทรัพย์และตลาดหลักทรัพย์ (ก.ล.ต.) `
  String get gettingStartedInfoOneContent {
    return Intl.message(
      '1109x ได้รับอนุญาตให้เป็นผู้ค้าสินทรัพย์ดิจิทัล และอยู่ ภายใต้การกำกับดูแลของสำนักงานคณะกรรมการกำกับหลักทรัพย์และตลาดหลักทรัพย์ (ก.ล.ต.) ',
      name: 'gettingStartedInfoOneContent',
      desc: '',
      args: [],
    );
  }

  /// `%บริการซื้อขาย%\nสินทรัพย์ดิจิทัล`
  String get gettingStartedInfoTwoTitle {
    return Intl.message(
      '%บริการซื้อขาย%\nสินทรัพย์ดิจิทัล',
      name: 'gettingStartedInfoTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `ให้บริการซื้อขายสินทรัพย์ดิจิทัลโดยตรง เพื่อหลีกเลี่ยงความซับซ้อนของตลาดแลกเปลี่ยนหรือคนกลาง`
  String get gettingStartedInfoTwoContent {
    return Intl.message(
      'ให้บริการซื้อขายสินทรัพย์ดิจิทัลโดยตรง เพื่อหลีกเลี่ยงความซับซ้อนของตลาดแลกเปลี่ยนหรือคนกลาง',
      name: 'gettingStartedInfoTwoContent',
      desc: '',
      args: [],
    );
  }

  /// `ไม่ต้องฝากเงิน/\nสินทรัพย์ดิจิทัล %ไว้ล่วงหน้า%`
  String get gettingStartedInfoThreeTitle {
    return Intl.message(
      'ไม่ต้องฝากเงิน/\nสินทรัพย์ดิจิทัล %ไว้ล่วงหน้า%',
      name: 'gettingStartedInfoThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `ผู้ใช้บริการสามารถโอนเงินเพื่อซื้อ หรือโอนสินทรัพย์ดิจิทัลเพื่อขาย โดยไม่ต้องนำมาฝากไว้ก่อนล่วงหน้า`
  String get gettingStartedInfoThreeContent {
    return Intl.message(
      'ผู้ใช้บริการสามารถโอนเงินเพื่อซื้อ หรือโอนสินทรัพย์ดิจิทัลเพื่อขาย โดยไม่ต้องนำมาฝากไว้ก่อนล่วงหน้า',
      name: 'gettingStartedInfoThreeContent',
      desc: '',
      args: [],
    );
  }

  /// `ถัดไป`
  String get gettingStartedInfoNext {
    return Intl.message(
      'ถัดไป',
      name: 'gettingStartedInfoNext',
      desc: '',
      args: [],
    );
  }

  /// `มาเริ่มกันเลย`
  String get gettingStartedInfoSubmit {
    return Intl.message(
      'มาเริ่มกันเลย',
      name: 'gettingStartedInfoSubmit',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get gettingStartedEnd {
    return Intl.message(
      '====================================================================',
      name: 'gettingStartedEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get createAccountStart {
    return Intl.message(
      '====================================================================',
      name: 'createAccountStart',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccountTitle {
    return Intl.message(
      'Create account',
      name: 'createAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get createAccountMobileLabel {
    return Intl.message(
      'Mobile number',
      name: 'createAccountMobileLabel',
      desc: '',
      args: [],
    );
  }

  /// `เมื่อสร้างและ/หรือใช้บัญชีของท่าน จะถือว่าท่านยอมรับ`
  String get createAccountAgreeTerm {
    return Intl.message(
      'เมื่อสร้างและ/หรือใช้บัญชีของท่าน จะถือว่าท่านยอมรับ',
      name: 'createAccountAgreeTerm',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get createAccountSubmitButton {
    return Intl.message(
      'Continue',
      name: 'createAccountSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `Please input your mobile number`
  String get createAccountErrorInputEmpty {
    return Intl.message(
      'Please input your mobile number',
      name: 'createAccountErrorInputEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please use eligible mobile number`
  String get createAccountErrorInputFormat {
    return Intl.message(
      'Please use eligible mobile number',
      name: 'createAccountErrorInputFormat',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get createdAccountEnd {
    return Intl.message(
      '====================================================================',
      name: 'createdAccountEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get otpVerificationStart {
    return Intl.message(
      '====================================================================',
      name: 'otpVerificationStart',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันเบอร์โทรศัพท์มือถือ`
  String get otpVerificationTitle {
    return Intl.message(
      'ยืนยันเบอร์โทรศัพท์มือถือ',
      name: 'otpVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรอก OTP`
  String get otpVerificationHeadline {
    return Intl.message(
      'กรอก OTP',
      name: 'otpVerificationHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ระบบได้ส่งรหัส 6 หลักไปที่เบอร์โทรศัพท์ @value`
  String get otpVerificationContent {
    return Intl.message(
      'ระบบได้ส่งรหัส 6 หลักไปที่เบอร์โทรศัพท์ @value',
      name: 'otpVerificationContent',
      desc: '',
      args: [],
    );
  }

  /// `ส่ง OTP อีกครั้ง`
  String get otpVerificationDidNotGetCode {
    return Intl.message(
      'ส่ง OTP อีกครั้ง',
      name: 'otpVerificationDidNotGetCode',
      desc: '',
      args: [],
    );
  }

  /// `ส่ง OTP อีกครั้ง`
  String get otpVerificationResendSMS {
    return Intl.message(
      'ส่ง OTP อีกครั้ง',
      name: 'otpVerificationResendSMS',
      desc: '',
      args: [],
    );
  }

  /// `รหัสยืนยันหมดอายุ กรณุากดส่ง OTP อีกครั้ง`
  String get otpVerificationExpire {
    return Intl.message(
      'รหัสยืนยันหมดอายุ กรณุากดส่ง OTP อีกครั้ง',
      name: 'otpVerificationExpire',
      desc: '',
      args: [],
    );
  }

  /// `รหัสยืนยันไม่ถูกต้อง กรุณาลองอีกครั้ง`
  String get otpVerificationInvalid {
    return Intl.message(
      'รหัสยืนยันไม่ถูกต้อง กรุณาลองอีกครั้ง',
      name: 'otpVerificationInvalid',
      desc: '',
      args: [],
    );
  }

  /// `มีบ้างอย่างผิดพลาด กรุณากดส่ง OTP อีกครั้ง`
  String get otpVerificationSomethingWentWrong {
    return Intl.message(
      'มีบ้างอย่างผิดพลาด กรุณากดส่ง OTP อีกครั้ง',
      name: 'otpVerificationSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get otpVerificationEnd {
    return Intl.message(
      '====================================================================',
      name: 'otpVerificationEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get signInStart {
    return Intl.message(
      '====================================================================',
      name: 'signInStart',
      desc: '',
      args: [],
    );
  }

  /// `Gasta`
  String get signInHeadline {
    return Intl.message(
      'Gasta',
      name: 'signInHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Hello! Welcome to GASTA Start your investment today`
  String get signInContent {
    return Intl.message(
      'Hello! Welcome to GASTA Start your investment today',
      name: 'signInContent',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signInAlreadyAccountContent {
    return Intl.message(
      'Already have an account?',
      name: 'signInAlreadyAccountContent',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInAlreadyAccountAction {
    return Intl.message(
      'Sign in',
      name: 'signInAlreadyAccountAction',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get signInCreateAccountButton {
    return Intl.message(
      'Create account',
      name: 'signInCreateAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get signInEnd {
    return Intl.message(
      '====================================================================',
      name: 'signInEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get phoneAuthStart {
    return Intl.message(
      '====================================================================',
      name: 'phoneAuthStart',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียน / เข้าสู่ระบบ`
  String get phoneAuthTitle {
    return Intl.message(
      'ลงทะเบียน / เข้าสู่ระบบ',
      name: 'phoneAuthTitle',
      desc: '',
      args: [],
    );
  }

  /// `เบอร์โทรศัพท์มือถือ`
  String get phoneAuthMobileLabel {
    return Intl.message(
      'เบอร์โทรศัพท์มือถือ',
      name: 'phoneAuthMobileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get phoneAuthSubmitButton {
    return Intl.message(
      'Sign in',
      name: 'phoneAuthSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `Please input your mobile number`
  String get phoneAuthErrorInputEmpty {
    return Intl.message(
      'Please input your mobile number',
      name: 'phoneAuthErrorInputEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please use eligible mobile number`
  String get phoneAuthErrorInputFormat {
    return Intl.message(
      'Please use eligible mobile number',
      name: 'phoneAuthErrorInputFormat',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get phoneAuthEnd {
    return Intl.message(
      '====================================================================',
      name: 'phoneAuthEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get welcomeBackStart {
    return Intl.message(
      '====================================================================',
      name: 'welcomeBackStart',
      desc: '',
      args: [],
    );
  }

  /// `ยินดีต้อนรับ`
  String get welcomeBackHeadlineHilight {
    return Intl.message(
      'ยินดีต้อนรับ',
      name: 'welcomeBackHeadlineHilight',
      desc: '',
      args: [],
    );
  }

  /// `Let’s get started`
  String get welcomeBackHeadline {
    return Intl.message(
      'Let’s get started',
      name: 'welcomeBackHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียนใหม่ หรือเข้าสู่ระบบ\nเพื่อซื้อขายสินทรัพย์ดิจิทัล`
  String get welcomeBackContent {
    return Intl.message(
      'ลงทะเบียนใหม่ หรือเข้าสู่ระบบ\nเพื่อซื้อขายสินทรัพย์ดิจิทัล',
      name: 'welcomeBackContent',
      desc: '',
      args: [],
    );
  }

  /// `ดำเนินการต่อด้วยเบอร์โทรศัพท์`
  String get welcomeBackSubmitButton {
    return Intl.message(
      'ดำเนินการต่อด้วยเบอร์โทรศัพท์',
      name: 'welcomeBackSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `เข้าสู่ระบบแบบไม่สมัครสมาชิก`
  String get welcomeBackContinueAsGuest {
    return Intl.message(
      'เข้าสู่ระบบแบบไม่สมัครสมาชิก',
      name: 'welcomeBackContinueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get welcomeBackEnd {
    return Intl.message(
      '====================================================================',
      name: 'welcomeBackEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get setFullnameStart {
    return Intl.message(
      '====================================================================',
      name: 'setFullnameStart',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get setFullnameTitle {
    return Intl.message(
      'Create account',
      name: 'setFullnameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Last step!`
  String get setFullnameHeadline {
    return Intl.message(
      'Last step!',
      name: 'setFullnameHeadline',
      desc: '',
      args: [],
    );
  }

  /// `What is your full name?`
  String get setFullnameHeadline2 {
    return Intl.message(
      'What is your full name?',
      name: 'setFullnameHeadline2',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get setFullnameFirstNameInputLabel {
    return Intl.message(
      'First name',
      name: 'setFullnameFirstNameInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get setFullnameLastNameInputLabel {
    return Intl.message(
      'Last name',
      name: 'setFullnameLastNameInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please give your real name that appears on your Passport or National ID card. For your security, this cannot be changed later.`
  String get setFullnameContent {
    return Intl.message(
      'Please give your real name that appears on your Passport or National ID card. For your security, this cannot be changed later.',
      name: 'setFullnameContent',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get setFullnameSubmitButton {
    return Intl.message(
      'Create account',
      name: 'setFullnameSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `Please input your first name`
  String get setFullnameFirstNameEmptyError {
    return Intl.message(
      'Please input your first name',
      name: 'setFullnameFirstNameEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Please input your last name`
  String get setFullnameLastNameEmptyError {
    return Intl.message(
      'Please input your last name',
      name: 'setFullnameLastNameEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get setFullnameEnd {
    return Intl.message(
      '====================================================================',
      name: 'setFullnameEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get createCompleteStart {
    return Intl.message(
      '====================================================================',
      name: 'createCompleteStart',
      desc: '',
      args: [],
    );
  }

  /// `Veriful mobile number success`
  String get createCompleteContent {
    return Intl.message(
      'Veriful mobile number success',
      name: 'createCompleteContent',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get createCompleteSubmitButton {
    return Intl.message(
      'Complete',
      name: 'createCompleteSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get createCompleteEnd {
    return Intl.message(
      '====================================================================',
      name: 'createCompleteEnd',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันรหัส PIN`
  String get enterPinTitle {
    return Intl.message(
      'ยืนยันรหัส PIN',
      name: 'enterPinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter a PIN`
  String get enterPinHeadline {
    return Intl.message(
      'Enter a PIN',
      name: 'enterPinHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ลืมรหัส PIN?`
  String get enterPinForgotPinLinkLabel {
    return Intl.message(
      'ลืมรหัส PIN?',
      name: 'enterPinForgotPinLinkLabel',
      desc: '',
      args: [],
    );
  }

  /// `Verify by Citizen ID / Passport No.`
  String get enterPinForgotPinLinkTextButton {
    return Intl.message(
      'Verify by Citizen ID / Passport No.',
      name: 'enterPinForgotPinLinkTextButton',
      desc: '',
      args: [],
    );
  }

  /// `Your %PIN% has\n %successfully% changed.`
  String get setPinCompleteHeadline {
    return Intl.message(
      'Your %PIN% has\n %successfully% changed.',
      name: 'setPinCompleteHeadline',
      desc: '',
      args: [],
    );
  }

  /// `You can use your new PIN when you open your \napp and make any transaction.`
  String get setPinCompleteContent {
    return Intl.message(
      'You can use your new PIN when you open your \napp and make any transaction.',
      name: 'setPinCompleteContent',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get setPinCompleteSubmitButton {
    return Intl.message(
      'Complete',
      name: 'setPinCompleteSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `KYC Level 2`
  String get kycTitle {
    return Intl.message(
      'KYC Level 2',
      name: 'kycTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรอกข้อมูล`
  String get kycStep2 {
    return Intl.message(
      'กรอกข้อมูล',
      name: 'kycStep2',
      desc: '',
      args: [],
    );
  }

  /// `ประเมิน`
  String get kycStep3 {
    return Intl.message(
      'ประเมิน',
      name: 'kycStep3',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน`
  String get kycStep4 {
    return Intl.message(
      'ยืนยันตัวตน',
      name: 'kycStep4',
      desc: '',
      args: [],
    );
  }

  /// `ข้อมูล %ทั่วไป%`
  String get kycInformationHeadline {
    return Intl.message(
      'ข้อมูล %ทั่วไป%',
      name: 'kycInformationHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อ (ภาษาอังกฤษ)`
  String get kycInformationFirstNameEngLabel {
    return Intl.message(
      'ชื่อ (ภาษาอังกฤษ)',
      name: 'kycInformationFirstNameEngLabel',
      desc: '',
      args: [],
    );
  }

  /// `ระบุชื่อ (ภาษาอังกฤษ)`
  String get kycInformationFirstNameEngPlaceholder {
    return Intl.message(
      'ระบุชื่อ (ภาษาอังกฤษ)',
      name: 'kycInformationFirstNameEngPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `นามสกุล (ภาษาอังกฤษ)`
  String get kycInformationLastNameEngLabel {
    return Intl.message(
      'นามสกุล (ภาษาอังกฤษ)',
      name: 'kycInformationLastNameEngLabel',
      desc: '',
      args: [],
    );
  }

  /// `ระบุนามสกุล (ภาษาอังกฤษ)`
  String get kycInformationLastNameEngPlaceholder {
    return Intl.message(
      'ระบุนามสกุล (ภาษาอังกฤษ)',
      name: 'kycInformationLastNameEngPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อ (ภาษาไทย)`
  String get kycInformationFirstNameThaiLabel {
    return Intl.message(
      'ชื่อ (ภาษาไทย)',
      name: 'kycInformationFirstNameThaiLabel',
      desc: '',
      args: [],
    );
  }

  /// `ระบุชื่อ (ภาษาไทย)`
  String get kycInformationFirstNameThaiPlaceholder {
    return Intl.message(
      'ระบุชื่อ (ภาษาไทย)',
      name: 'kycInformationFirstNameThaiPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `นามสกุล (ภาษาไทย)`
  String get kycInformationLastNameThaiLabel {
    return Intl.message(
      'นามสกุล (ภาษาไทย)',
      name: 'kycInformationLastNameThaiLabel',
      desc: '',
      args: [],
    );
  }

  /// `ระบุนามสกุล (ภาษาไทย)`
  String get kycInformationLastNameThaiPlaceholder {
    return Intl.message(
      'ระบุนามสกุล (ภาษาไทย)',
      name: 'kycInformationLastNameThaiPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `วัน/เดือน/ปีเกิด`
  String get kycInformationDateOfBirthLabel {
    return Intl.message(
      'วัน/เดือน/ปีเกิด',
      name: 'kycInformationDateOfBirthLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือก วัน/เดือน/ปีเกิด`
  String get kycInformationDateOfBirthPlaceholder {
    return Intl.message(
      'เลือก วัน/เดือน/ปีเกิด',
      name: 'kycInformationDateOfBirthPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เพศ`
  String get kycInformationGenderLabel {
    return Intl.message(
      'เพศ',
      name: 'kycInformationGenderLabel',
      desc: '',
      args: [],
    );
  }

  /// `ชาย`
  String get kycInformationGenderMale {
    return Intl.message(
      'ชาย',
      name: 'kycInformationGenderMale',
      desc: '',
      args: [],
    );
  }

  /// `หญิง`
  String get kycInformationGenderFemale {
    return Intl.message(
      'หญิง',
      name: 'kycInformationGenderFemale',
      desc: '',
      args: [],
    );
  }

  /// `LGBTQ+`
  String get kycInformationGenderLGBTQ {
    return Intl.message(
      'LGBTQ+',
      name: 'kycInformationGenderLGBTQ',
      desc: '',
      args: [],
    );
  }

  /// `เลขบัตรประจำตัวประชาชน`
  String get kycInformationIdCardLabel {
    return Intl.message(
      'เลขบัตรประจำตัวประชาชน',
      name: 'kycInformationIdCardLabel',
      desc: '',
      args: [],
    );
  }

  /// `ระบุเลขบัตรประจำตัวประชาชนของคุณ`
  String get kycInformationIdCardPlaceholder {
    return Intl.message(
      'ระบุเลขบัตรประจำตัวประชาชนของคุณ',
      name: 'kycInformationIdCardPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เลขหลังบัตรประจำตัวประชาชน (Laser Code)`
  String get kycInformationlaserCardLabel {
    return Intl.message(
      'เลขหลังบัตรประจำตัวประชาชน (Laser Code)',
      name: 'kycInformationlaserCardLabel',
      desc: '',
      args: [],
    );
  }

  /// `วันหมดอายุบัตร`
  String get kycInformationIdCardExpireAtLabel {
    return Intl.message(
      'วันหมดอายุบัตร',
      name: 'kycInformationIdCardExpireAtLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือกวันหมดอายุบัตรประชาชน`
  String get kycInformationIdCardExpireAtPlaceholder {
    return Intl.message(
      'เลือกวันหมดอายุบัตรประชาชน',
      name: 'kycInformationIdCardExpireAtPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ %ตามบัตรประชาชน%`
  String get kycAddressHeadline1 {
    return Intl.message(
      'ที่อยู่ %ตามบัตรประชาชน%',
      name: 'kycAddressHeadline1',
      desc: '',
      args: [],
    );
  }

  /// `เลขที่ *`
  String get kycAddressNumber {
    return Intl.message(
      'เลขที่ *',
      name: 'kycAddressNumber',
      desc: '',
      args: [],
    );
  }

  /// `หมู่ที่`
  String get kycAddressMoo {
    return Intl.message(
      'หมู่ที่',
      name: 'kycAddressMoo',
      desc: '',
      args: [],
    );
  }

  /// `หมู่บ้าน/อพาตเมนท์/คอนโด`
  String get kycAddressOptional1 {
    return Intl.message(
      'หมู่บ้าน/อพาตเมนท์/คอนโด',
      name: 'kycAddressOptional1',
      desc: '',
      args: [],
    );
  }

  /// `ซอย`
  String get kycAddressSoi {
    return Intl.message(
      'ซอย',
      name: 'kycAddressSoi',
      desc: '',
      args: [],
    );
  }

  /// `ถนน`
  String get kycAddressRoad {
    return Intl.message(
      'ถนน',
      name: 'kycAddressRoad',
      desc: '',
      args: [],
    );
  }

  /// `จังหวัด *`
  String get kycAddressProvince {
    return Intl.message(
      'จังหวัด *',
      name: 'kycAddressProvince',
      desc: '',
      args: [],
    );
  }

  /// `เลือกจังหวัด`
  String get kycAddressProvincePlaceholder {
    return Intl.message(
      'เลือกจังหวัด',
      name: 'kycAddressProvincePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เขต/อำเภอ *`
  String get kycAddressDistinct {
    return Intl.message(
      'เขต/อำเภอ *',
      name: 'kycAddressDistinct',
      desc: '',
      args: [],
    );
  }

  /// `เลือกเขต/อำเภอ`
  String get kycAddressDistrictPlaceholder {
    return Intl.message(
      'เลือกเขต/อำเภอ',
      name: 'kycAddressDistrictPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `แขวง/ตำบล *`
  String get kycAddressSubDistinct {
    return Intl.message(
      'แขวง/ตำบล *',
      name: 'kycAddressSubDistinct',
      desc: '',
      args: [],
    );
  }

  /// `เลือกแขวง/ตำบล`
  String get kycAddressSubDistrictPlaceholder {
    return Intl.message(
      'เลือกแขวง/ตำบล',
      name: 'kycAddressSubDistrictPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `รหัสไปรษณีย์`
  String get kycAddressPostCode {
    return Intl.message(
      'รหัสไปรษณีย์',
      name: 'kycAddressPostCode',
      desc: '',
      args: [],
    );
  }

  /// `ประเทศ`
  String get kycAddressCountry {
    return Intl.message(
      'ประเทศ',
      name: 'kycAddressCountry',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ %ปัจจุบัน%`
  String get kycAddressHeadline2 {
    return Intl.message(
      'ที่อยู่ %ปัจจุบัน%',
      name: 'kycAddressHeadline2',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ตามบัตรประชาชน`
  String get kycAddressSwitchOption1 {
    return Intl.message(
      'ที่อยู่ตามบัตรประชาชน',
      name: 'kycAddressSwitchOption1',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่อื่น (โปรดระบุ)`
  String get kycAddressSwitchOption2 {
    return Intl.message(
      'ที่อยู่อื่น (โปรดระบุ)',
      name: 'kycAddressSwitchOption2',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %จังหวัด%`
  String get selectProvinceHeadline {
    return Intl.message(
      'เลือก %จังหวัด%',
      name: 'selectProvinceHeadline',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %อำเภอ%`
  String get selectDistrictHeadline {
    return Intl.message(
      'เลือก %อำเภอ%',
      name: 'selectDistrictHeadline',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %ตำบล%`
  String get selectSubDistrictHeadline {
    return Intl.message(
      'เลือก %ตำบล%',
      name: 'selectSubDistrictHeadline',
      desc: '',
      args: [],
    );
  }

  /// `อาชีพ %ปัจจุบัน%`
  String get kycFundHeadline {
    return Intl.message(
      'อาชีพ %ปัจจุบัน%',
      name: 'kycFundHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ %ที่ทำงาน/สถานศึกษา%`
  String get kycWorkingAddressHeadline {
    return Intl.message(
      'ที่อยู่ %ที่ทำงาน/สถานศึกษา%',
      name: 'kycWorkingAddressHeadline',
      desc: '',
      args: [],
    );
  }

  /// `เลือกอาชีพ`
  String get kycFundOccupationLabel {
    return Intl.message(
      'เลือกอาชีพ',
      name: 'kycFundOccupationLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือกอาชีพ`
  String get kycFundOccupationPlaceholder {
    return Intl.message(
      'เลือกอาชีพ',
      name: 'kycFundOccupationPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %สาขาอาชีพ%`
  String get kycFundOccuptationSelectHeadline {
    return Intl.message(
      'เลือก %สาขาอาชีพ%',
      name: 'kycFundOccuptationSelectHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ช่วงของรายได้ (ต่อเดือน)`
  String get kycFundIncomeRangeLabel {
    return Intl.message(
      'ช่วงของรายได้ (ต่อเดือน)',
      name: 'kycFundIncomeRangeLabel',
      desc: '',
      args: [],
    );
  }

  /// `8,000 - 15,000`
  String get kycFundIncomeOption1 {
    return Intl.message(
      '8,000 - 15,000',
      name: 'kycFundIncomeOption1',
      desc: '',
      args: [],
    );
  }

  /// `15,000 - 30,000`
  String get kycFundIncomeOption2 {
    return Intl.message(
      '15,000 - 30,000',
      name: 'kycFundIncomeOption2',
      desc: '',
      args: [],
    );
  }

  /// `30,000 - 50,000`
  String get kycFundIncomeOption3 {
    return Intl.message(
      '30,000 - 50,000',
      name: 'kycFundIncomeOption3',
      desc: '',
      args: [],
    );
  }

  /// `50,000 - 100,000`
  String get kycFundIncomeOption4 {
    return Intl.message(
      '50,000 - 100,000',
      name: 'kycFundIncomeOption4',
      desc: '',
      args: [],
    );
  }

  /// `100,000+`
  String get kycFundIncomeOption5 {
    return Intl.message(
      '100,000+',
      name: 'kycFundIncomeOption5',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อที่ทำงาน / สถานศึกษา`
  String get kycFundWorkingPlaceNameLabel {
    return Intl.message(
      'ชื่อที่ทำงาน / สถานศึกษา',
      name: 'kycFundWorkingPlaceNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `อาชีพอื่นที่ทำรายได้สูงสุด`
  String get kycFundAnotherJob {
    return Intl.message(
      'อาชีพอื่นที่ทำรายได้สูงสุด',
      name: 'kycFundAnotherJob',
      desc: '',
      args: [],
    );
  }

  /// `ช่วงของรายได้ อาชีพอื่นที่ทำรายได้สูงสุด (ต่อเดือน)`
  String get kycFundAnotherJobSalaryRange {
    return Intl.message(
      'ช่วงของรายได้ อาชีพอื่นที่ทำรายได้สูงสุด (ต่อเดือน)',
      name: 'kycFundAnotherJobSalaryRange',
      desc: '',
      args: [],
    );
  }

  /// `หลักฐานการได้มาซึ่งรายได้`
  String get kycFundAnotherJobDocument {
    return Intl.message(
      'หลักฐานการได้มาซึ่งรายได้',
      name: 'kycFundAnotherJobDocument',
      desc: '',
      args: [],
    );
  }

  /// `เช่น รายการเดินบัญชีธนาคาร สลิปเงินเดือน หลักฐานการจ่ายเงิน สมทบกองทุนประกันสุงคม เป็นต้น`
  String get kycFundAnotherJobDocumentDesc {
    return Intl.message(
      'เช่น รายการเดินบัญชีธนาคาร สลิปเงินเดือน หลักฐานการจ่ายเงิน สมทบกองทุนประกันสุงคม เป็นต้น',
      name: 'kycFundAnotherJobDocumentDesc',
      desc: '',
      args: [],
    );
  }

  /// `แตะเพื่อแนบหลักฐาน`
  String get kycFundAnotherJobUploadHint {
    return Intl.message(
      'แตะเพื่อแนบหลักฐาน',
      name: 'kycFundAnotherJobUploadHint',
      desc: '',
      args: [],
    );
  }

  /// `หลักฐานการถือครองสินทรัพย์`
  String get kycFundAnotherJobAssetDocument {
    return Intl.message(
      'หลักฐานการถือครองสินทรัพย์',
      name: 'kycFundAnotherJobAssetDocument',
      desc: '',
      args: [],
    );
  }

  /// `เช่น รายการเดินบัญชีธนาคาร สลากออมสิน โฉนดที่ดิน สมุดทะเบียนรถยนต์ เป็นต้น`
  String get kycFundAnotherJobAssetDocumentDesc {
    return Intl.message(
      'เช่น รายการเดินบัญชีธนาคาร สลากออมสิน โฉนดที่ดิน สมุดทะเบียนรถยนต์ เป็นต้น',
      name: 'kycFundAnotherJobAssetDocumentDesc',
      desc: '',
      args: [],
    );
  }

  /// `< 15,000 บาท`
  String get kycFundAnotherJobIncomeOption1 {
    return Intl.message(
      '< 15,000 บาท',
      name: 'kycFundAnotherJobIncomeOption1',
      desc: '',
      args: [],
    );
  }

  /// `15,000 - 49,999 บาท`
  String get kycFundAnotherJobIncomeOption2 {
    return Intl.message(
      '15,000 - 49,999 บาท',
      name: 'kycFundAnotherJobIncomeOption2',
      desc: '',
      args: [],
    );
  }

  /// `50,000 - 99,999 บาท`
  String get kycFundAnotherJobIncomeOption3 {
    return Intl.message(
      '50,000 - 99,999 บาท',
      name: 'kycFundAnotherJobIncomeOption3',
      desc: '',
      args: [],
    );
  }

  /// `100,000 - 499,999 บาท`
  String get kycFundAnotherJobIncomeOption4 {
    return Intl.message(
      '100,000 - 499,999 บาท',
      name: 'kycFundAnotherJobIncomeOption4',
      desc: '',
      args: [],
    );
  }

  /// `500,000+ บาท`
  String get kycFundAnotherJobIncomeOption5 {
    return Intl.message(
      '500,000+ บาท',
      name: 'kycFundAnotherJobIncomeOption5',
      desc: '',
      args: [],
    );
  }

  /// `Can't be empty`
  String get validateTextFieldIsEmpty {
    return Intl.message(
      'Can\'t be empty',
      name: 'validateTextFieldIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Wrong laser id card format`
  String get validateTextLaserIdCardPrefix {
    return Intl.message(
      'Wrong laser id card format',
      name: 'validateTextLaserIdCardPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Wrong laser id card format`
  String get validateTextLaserIdCardNumber {
    return Intl.message(
      'Wrong laser id card format',
      name: 'validateTextLaserIdCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Wrong id card format`
  String get validateTextIdCard {
    return Intl.message(
      'Wrong id card format',
      name: 'validateTextIdCard',
      desc: '',
      args: [],
    );
  }

  /// `บุคคลอเมริกัน %FATCA%`
  String get kycAcceptLawHeadline {
    return Intl.message(
      'บุคคลอเมริกัน %FATCA%',
      name: 'kycAcceptLawHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ข้าพเจ้ามีข้อใดข้อหนึ่งดังนี้`
  String get kycAcceptLawContentTitle {
    return Intl.message(
      'ข้าพเจ้ามีข้อใดข้อหนึ่งดังนี้',
      name: 'kycAcceptLawContentTitle',
      desc: '',
      args: [],
    );
  }

  /// `มีสัญชาติอเมริกัน / เกิดที่ อเมริกา / มีที่อยู่ในอเมริกาสำหรับพักอาศัยและติดต่อ`
  String get kycAcceptLawContentRole1 {
    return Intl.message(
      'มีสัญชาติอเมริกัน / เกิดที่ อเมริกา / มีที่อยู่ในอเมริกาสำหรับพักอาศัยและติดต่อ',
      name: 'kycAcceptLawContentRole1',
      desc: '',
      args: [],
    );
  }

  /// `โอนเงินเป็นประจำไปบัญชีทีอเมริกา`
  String get kycAcceptLawContentRole2 {
    return Intl.message(
      'โอนเงินเป็นประจำไปบัญชีทีอเมริกา',
      name: 'kycAcceptLawContentRole2',
      desc: '',
      args: [],
    );
  }

  /// `คลิกดูรายละเอียดข้อตกลงและเงื่อนไข`
  String get kycAcceptLawDocumentLink {
    return Intl.message(
      'คลิกดูรายละเอียดข้อตกลงและเงื่อนไข',
      name: 'kycAcceptLawDocumentLink',
      desc: '',
      args: [],
    );
  }

  /// `ข้าพเจ้ายืนยันว่าคำรับรองที่ให้ไว้กับทางบริษัทฯ เป็นความจริง ทุกประการ และเข้าใจว่าเมื่อข้อมูลข้างต้น เปลี่ยนแปลง ข้าพเจ้า จะแจ้งบริษัทฯ ในทันที`
  String get kycAcceptLawFooter {
    return Intl.message(
      'ข้าพเจ้ายืนยันว่าคำรับรองที่ให้ไว้กับทางบริษัทฯ เป็นความจริง ทุกประการ และเข้าใจว่าเมื่อข้อมูลข้างต้น เปลี่ยนแปลง ข้าพเจ้า จะแจ้งบริษัทฯ ในทันที',
      name: 'kycAcceptLawFooter',
      desc: '',
      args: [],
    );
  }

  /// `ประเมิน %ความเหมาะสมในการลงทุน%`
  String get kycSuiteableHeadline {
    return Intl.message(
      'ประเมิน %ความเหมาะสมในการลงทุน%',
      name: 'kycSuiteableHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ระดับความเสี่ยงประเภทนักลงทุน`
  String get kycSuiteableChoiceLabel {
    return Intl.message(
      'ระดับความเสี่ยงประเภทนักลงทุน',
      name: 'kycSuiteableChoiceLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือกระดับความเสี่ยงประเภทนักลงทุน`
  String get kycSuiteableChoicePlaceholder {
    return Intl.message(
      'เลือกระดับความเสี่ยงประเภทนักลงทุน',
      name: 'kycSuiteableChoicePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เลือกระดับ %ความเสี่ยง%`
  String get kycSuiteableChoiceSelectHeadline {
    return Intl.message(
      'เลือกระดับ %ความเสี่ยง%',
      name: 'kycSuiteableChoiceSelectHeadline',
      desc: '',
      args: [],
    );
  }

  /// `เสี่ยงต่ำ`
  String get kycSuiteableChoiceOption1 {
    return Intl.message(
      'เสี่ยงต่ำ',
      name: 'kycSuiteableChoiceOption1',
      desc: '',
      args: [],
    );
  }

  /// `เสี่ยงกลาง`
  String get kycSuiteableChoiceOption2 {
    return Intl.message(
      'เสี่ยงกลาง',
      name: 'kycSuiteableChoiceOption2',
      desc: '',
      args: [],
    );
  }

  /// `เสี่ยงสูง`
  String get kycSuiteableChoiceOption3 {
    return Intl.message(
      'เสี่ยงสูง',
      name: 'kycSuiteableChoiceOption3',
      desc: '',
      args: [],
    );
  }

  /// `เสี่ยงสูงมาก`
  String get kycSuiteableChoiceOption4 {
    return Intl.message(
      'เสี่ยงสูงมาก',
      name: 'kycSuiteableChoiceOption4',
      desc: '',
      args: [],
    );
  }

  /// `ผลคะแนนของท่าน`
  String get kycSuiteableScoreHeadline {
    return Intl.message(
      'ผลคะแนนของท่าน',
      name: 'kycSuiteableScoreHeadline',
      desc: '',
      args: [],
    );
  }

  /// `การวิเคราะห์ผล`
  String get kycSuiteableResultHeadline {
    return Intl.message(
      'การวิเคราะห์ผล',
      name: 'kycSuiteableResultHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ท่านเป็นนักลงทุนประเภท`
  String get kycSuiteableResultContent {
    return Intl.message(
      'ท่านเป็นนักลงทุนประเภท',
      name: 'kycSuiteableResultContent',
      desc: '',
      args: [],
    );
  }

  /// `ศึกษาหรือแก้ไขรายละเอียดแบบประเมิน`
  String get kycSuiteableQuestionLinkButton {
    return Intl.message(
      'ศึกษาหรือแก้ไขรายละเอียดแบบประเมิน',
      name: 'kycSuiteableQuestionLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `ประเภทตราสารที่สามารถลงทุนได้`
  String get kycSuiteableListOfAvailableInvestment {
    return Intl.message(
      'ประเภทตราสารที่สามารถลงทุนได้',
      name: 'kycSuiteableListOfAvailableInvestment',
      desc: '',
      args: [],
    );
  }

  /// `ประเมิน %ความเหมาะสมในการลงทุน%`
  String get suiteableQuestionHeadline {
    return Intl.message(
      'ประเมิน %ความเหมาะสมในการลงทุน%',
      name: 'suiteableQuestionHeadline',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกข้อที่ตรงกับท่านมากที่สุด`
  String get suiteableQuestionDescription {
    return Intl.message(
      'กรุณาเลือกข้อที่ตรงกับท่านมากที่สุด',
      name: 'suiteableQuestionDescription',
      desc: '',
      args: [],
    );
  }

  /// `ประเมิน %ความรู้ในการลงทุน%`
  String get preKnowledgeTestHeadline {
    return Intl.message(
      'ประเมิน %ความรู้ในการลงทุน%',
      name: 'preKnowledgeTestHeadline',
      desc: '',
      args: [],
    );
  }

  /// `โปรดทำแบบทดสอบเกี่ยวกับพื้นฐานสินทรัพย์ดิจิทัล`
  String get preKnowledgeTestDescription {
    return Intl.message(
      'โปรดทำแบบทดสอบเกี่ยวกับพื้นฐานสินทรัพย์ดิจิทัล',
      name: 'preKnowledgeTestDescription',
      desc: '',
      args: [],
    );
  }

  /// `แบบประเมินใช้เวลา  5-10 นาที`
  String get preKnowledgeTestStep1 {
    return Intl.message(
      'แบบประเมินใช้เวลา  5-10 นาที',
      name: 'preKnowledgeTestStep1',
      desc: '',
      args: [],
    );
  }

  /// `แบบประเมินนี้จัดทำขึ้นเพื่อทดสอบความรู้ความเข้าใจเกี่ยวกับพื้นฐานสินทรัพย์ดิจิทัลของท่านก่อนเริ่มการซื้อขายจริง`
  String get preKnowledgeTestStep2 {
    return Intl.message(
      'แบบประเมินนี้จัดทำขึ้นเพื่อทดสอบความรู้ความเข้าใจเกี่ยวกับพื้นฐานสินทรัพย์ดิจิทัลของท่านก่อนเริ่มการซื้อขายจริง',
      name: 'preKnowledgeTestStep2',
      desc: '',
      args: [],
    );
  }

  /// `ผลคะแนนไม่มีผลต่อการยืนยันตัวตนหรือการใช้บริการ`
  String get preKnowledgeTestStep3 {
    return Intl.message(
      'ผลคะแนนไม่มีผลต่อการยืนยันตัวตนหรือการใช้บริการ',
      name: 'preKnowledgeTestStep3',
      desc: '',
      args: [],
    );
  }

  /// `แบบประเมิน %ความรู้ในการลงทุน%`
  String get knowledgeQuestionHeadline {
    return Intl.message(
      'แบบประเมิน %ความรู้ในการลงทุน%',
      name: 'knowledgeQuestionHeadline',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกข้อที่ตรงกับท่านมากที่สุดเพื่อท่านจะได้ทรายบว่าท่านเหมาะที่จะลงทุนในทรัพย์สินประเภทใด`
  String get knowledgeQuestionDescription {
    return Intl.message(
      'กรุณาเลือกข้อที่ตรงกับท่านมากที่สุดเพื่อท่านจะได้ทรายบว่าท่านเหมาะที่จะลงทุนในทรัพย์สินประเภทใด',
      name: 'knowledgeQuestionDescription',
      desc: '',
      args: [],
    );
  }

  /// `ท่านผ่านการประเมิน`
  String get knowledgeResultSuccess {
    return Intl.message(
      'ท่านผ่านการประเมิน',
      name: 'knowledgeResultSuccess',
      desc: '',
      args: [],
    );
  }

  /// `ท่านไม่ผ่านการประเมิน`
  String get knowledgeResultFailed {
    return Intl.message(
      'ท่านไม่ผ่านการประเมิน',
      name: 'knowledgeResultFailed',
      desc: '',
      args: [],
    );
  }

  /// `ทำแบบประเมินอีกครั้ง`
  String get knowledgeReTestLinkButton {
    return Intl.message(
      'ทำแบบประเมินอีกครั้ง',
      name: 'knowledgeReTestLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `ท่านสามารถเลือก "ยืนยันตัวตน" ผ่านช่องทางที่ท่านสะดวกอย่างใดอย่างหนึ่ง ดังนี้`
  String get kycWayDescription {
    return Intl.message(
      'ท่านสามารถเลือก "ยืนยันตัวตน" ผ่านช่องทางที่ท่านสะดวกอย่างใดอย่างหนึ่ง ดังนี้',
      name: 'kycWayDescription',
      desc: '',
      args: [],
    );
  }

  /// `1. แอปพลิเคชันของผู้ให้บริการยืนยัน ตัวตน ผ่านบริการของ NDID`
  String get kycWayChioce1 {
    return Intl.message(
      '1. แอปพลิเคชันของผู้ให้บริการยืนยัน ตัวตน ผ่านบริการของ NDID',
      name: 'kycWayChioce1',
      desc: '',
      args: [],
    );
  }

  /// `2. Dip Chip บัตรประชาชน`
  String get kycWayChoice2 {
    return Intl.message(
      '2. Dip Chip บัตรประชาชน',
      name: 'kycWayChoice2',
      desc: '',
      args: [],
    );
  }

  /// `3. Dip-Chip Rider ผ่านบริการของ APPMAN`
  String get kycWayChoice3 {
    return Intl.message(
      '3. Dip-Chip Rider ผ่านบริการของ APPMAN',
      name: 'kycWayChoice3',
      desc: '',
      args: [],
    );
  }

  /// `มีบัญชีกับผู้ให้บริการยืนยันตัวตนที่ท่านเลือก`
  String get kycWayChoice1Description1 {
    return Intl.message(
      'มีบัญชีกับผู้ให้บริการยืนยันตัวตนที่ท่านเลือก',
      name: 'kycWayChoice1Description1',
      desc: '',
      args: [],
    );
  }

  /// `เคยทำธุรกรรมกับผู้ให้บริการยืนยันตัวตน\nโดยการเสียบบัตรประชาชนผ่านเครื่องอ่านบัตร`
  String get kycWayChoice1Description2 {
    return Intl.message(
      'เคยทำธุรกรรมกับผู้ให้บริการยืนยันตัวตน\nโดยการเสียบบัตรประชาชนผ่านเครื่องอ่านบัตร',
      name: 'kycWayChoice1Description2',
      desc: '',
      args: [],
    );
  }

  /// `มีโมบายแอปพลิเคชันของผู้ให้บริการยืนยันตัวตนที่ท่านเลือกบนโทรศัพท์มือถือ (Smart phone ทั้ง ios หรือ Android) และพร้อมใช้งาน`
  String get kycWayChoice1Description3 {
    return Intl.message(
      'มีโมบายแอปพลิเคชันของผู้ให้บริการยืนยันตัวตนที่ท่านเลือกบนโทรศัพท์มือถือ (Smart phone ทั้ง ios หรือ Android) และพร้อมใช้งาน',
      name: 'kycWayChoice1Description3',
      desc: '',
      args: [],
    );
  }

  /// `เคยถ่ายรูปใบหน้าตัวเองบนโมบายแอปพลิเคชัน หรือที่สาขาของผู้ให้บริการยืนยันตัวตนที่ท่านเลือก`
  String get kycWayChoice1Description4 {
    return Intl.message(
      'เคยถ่ายรูปใบหน้าตัวเองบนโมบายแอปพลิเคชัน หรือที่สาขาของผู้ให้บริการยืนยันตัวตนที่ท่านเลือก',
      name: 'kycWayChoice1Description4',
      desc: '',
      args: [],
    );
  }

  /// `ทำรายการให้สำเร็จภายใน 60 นาที`
  String get kycWayChoice1Description5 {
    return Intl.message(
      'ทำรายการให้สำเร็จภายใน 60 นาที',
      name: 'kycWayChoice1Description5',
      desc: '',
      args: [],
    );
  }

  /// `มีค่าดำเนินการยืนยันตัวตน 130 บาท`
  String get kycWayChoice1Description6 {
    return Intl.message(
      'มีค่าดำเนินการยืนยันตัวตน 130 บาท',
      name: 'kycWayChoice1Description6',
      desc: '',
      args: [],
    );
  }

  /// `นำบัตรประชาชนที่ยังไม่หมดอายุเสียบกับเครื่องอ่านบัตร (Dip Chip) ที่สำนักงานของบริษัทฯ`
  String get kycWayChoice2Description1 {
    return Intl.message(
      'นำบัตรประชาชนที่ยังไม่หมดอายุเสียบกับเครื่องอ่านบัตร (Dip Chip) ที่สำนักงานของบริษัทฯ',
      name: 'kycWayChoice2Description1',
      desc: '',
      args: [],
    );
  }

  /// `ทํารายการให้สําเร็จภายใน 24 ชั่วโมง`
  String get kycWayChoice2Description2 {
    return Intl.message(
      'ทํารายการให้สําเร็จภายใน 24 ชั่วโมง',
      name: 'kycWayChoice2Description2',
      desc: '',
      args: [],
    );
  }

  /// `ไม่มีค่าดำเนินการยืนยันตัวตน`
  String get kycWayChoice2Description3 {
    return Intl.message(
      'ไม่มีค่าดำเนินการยืนยันตัวตน',
      name: 'kycWayChoice2Description3',
      desc: '',
      args: [],
    );
  }

  /// `re-face recognition with ID card`
  String get kycWayChoice3Description1 {
    return Intl.message(
      're-face recognition with ID card',
      name: 'kycWayChoice3Description1',
      desc: '',
      args: [],
    );
  }

  /// `appointment 1 day in advance, arrival within 24hours`
  String get kycWayChoice3Description2 {
    return Intl.message(
      'appointment 1 day in advance, arrival within 24hours',
      name: 'kycWayChoice3Description2',
      desc: '',
      args: [],
    );
  }

  /// `cover 77 provinces, bangkok and perimeter, other provinces (only muang districts)`
  String get kycWayChoice3Description3 {
    return Intl.message(
      'cover 77 provinces, bangkok and perimeter, other provinces (only muang districts)',
      name: 'kycWayChoice3Description3',
      desc: '',
      args: [],
    );
  }

  /// `มีค่าธรรมเนียม 130 บาท`
  String get kycWayChoice3Description4 {
    return Intl.message(
      'มีค่าธรรมเนียม 130 บาท',
      name: 'kycWayChoice3Description4',
      desc: '',
      args: [],
    );
  }

  /// `ID %Upload%`
  String get kycIntrodunction1Headline {
    return Intl.message(
      'ID %Upload%',
      name: 'kycIntrodunction1Headline',
      desc: '',
      args: [],
    );
  }

  /// `1. Take a photo of your Original National ID Card\n2. A selfie of yourself`
  String get kycIntrodunction1Description {
    return Intl.message(
      '1. Take a photo of your Original National ID Card\n2. A selfie of yourself',
      name: 'kycIntrodunction1Description',
      desc: '',
      args: [],
    );
  }

  /// `Please Make Sure %Your National ID Card Has...%`
  String get kycIntrodunction2Headline {
    return Intl.message(
      'Please Make Sure %Your National ID Card Has...%',
      name: 'kycIntrodunction2Headline',
      desc: '',
      args: [],
    );
  }

  /// `Clearly visible detail and the expiration date not approaching within the next 60 days.`
  String get kycIntrodunction2Description {
    return Intl.message(
      'Clearly visible detail and the expiration date not approaching within the next 60 days.',
      name: 'kycIntrodunction2Description',
      desc: '',
      args: [],
    );
  }

  /// `Photos of %Your National Id Card%`
  String get kycIntrodunction3Headline {
    return Intl.message(
      'Photos of %Your National Id Card%',
      name: 'kycIntrodunction3Headline',
      desc: '',
      args: [],
    );
  }

  /// `Take photo of Both sides of the card. make sure the photos are visible in the frame.`
  String get kycIntrodunction3Description {
    return Intl.message(
      'Take photo of Both sides of the card. make sure the photos are visible in the frame.',
      name: 'kycIntrodunction3Description',
      desc: '',
      args: [],
    );
  }

  /// `Photos of %Your National Id Card%`
  String get kycIntrodunction4Headline {
    return Intl.message(
      'Photos of %Your National Id Card%',
      name: 'kycIntrodunction4Headline',
      desc: '',
      args: [],
    );
  }

  /// `The Photos must be clear and well-lit.`
  String get kycIntrodunction4Description {
    return Intl.message(
      'The Photos must be clear and well-lit.',
      name: 'kycIntrodunction4Description',
      desc: '',
      args: [],
    );
  }

  /// `A %Selfie%`
  String get kycIntrodunction5Headline {
    return Intl.message(
      'A %Selfie%',
      name: 'kycIntrodunction5Headline',
      desc: '',
      args: [],
    );
  }

  /// `Take a selfie of yourself. Make sure your whole face is visible and centered.`
  String get kycIntrodunction5Description {
    return Intl.message(
      'Take a selfie of yourself. Make sure your whole face is visible and centered.',
      name: 'kycIntrodunction5Description',
      desc: '',
      args: [],
    );
  }

  /// `Scan Document`
  String get captureDocumentNavTitle {
    return Intl.message(
      'Scan Document',
      name: 'captureDocumentNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan Identity Card Front`
  String get captureDocumentIdCardHeadline {
    return Intl.message(
      'Scan Identity Card Front',
      name: 'captureDocumentIdCardHeadline',
      desc: '',
      args: [],
    );
  }

  /// `อัพโหลดเอกสาร`
  String get kycUploadIdCardHeadline {
    return Intl.message(
      'อัพโหลดเอกสาร',
      name: 'kycUploadIdCardHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายภาพบัตรประชาชน - ด้านหน้า`
  String get kycUploadIdCardFrontHeadline {
    return Intl.message(
      'ถ่ายภาพบัตรประชาชน - ด้านหน้า',
      name: 'kycUploadIdCardFrontHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายภาพบัตรประชาชน - ด้านหลัง`
  String get kycUploadIdCardBackHeadline {
    return Intl.message(
      'ถ่ายภาพบัตรประชาชน - ด้านหลัง',
      name: 'kycUploadIdCardBackHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายภาพใบหน้า`
  String get kycUploadSelfieHeadline {
    return Intl.message(
      'ถ่ายภาพใบหน้า',
      name: 'kycUploadSelfieHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายรูปใหม่`
  String get kycUploadIdCardCaptureImageButton {
    return Intl.message(
      'ถ่ายรูปใหม่',
      name: 'kycUploadIdCardCaptureImageButton',
      desc: '',
      args: [],
    );
  }

  /// `Face Live Detection`
  String get kycUploadIdCardFaceLiveHeadline {
    return Intl.message(
      'Face Live Detection',
      name: 'kycUploadIdCardFaceLiveHeadline',
      desc: '',
      args: [],
    );
  }

  /// `กรอกข้อมูล`
  String get kycLevel1Step1 {
    return Intl.message(
      'กรอกข้อมูล',
      name: 'kycLevel1Step1',
      desc: '',
      args: [],
    );
  }

  /// `ตรวจสอบ`
  String get kycLevel1Step2 {
    return Intl.message(
      'ตรวจสอบ',
      name: 'kycLevel1Step2',
      desc: '',
      args: [],
    );
  }

  /// `KYC Level 1`
  String get kycLevel1Title {
    return Intl.message(
      'KYC Level 1',
      name: 'kycLevel1Title',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน ระดับ 1 ไม่สำเร็จ`
  String get kycLevel1FailedTitle {
    return Intl.message(
      'ยืนยันตัวตน ระดับ 1 ไม่สำเร็จ',
      name: 'kycLevel1FailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ ตามรายละเอียด จึงไม่สามารถให้บริการท่านได้`
  String get kycLevel1FailedContent {
    return Intl.message(
      'เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ ตามรายละเอียด จึงไม่สามารถให้บริการท่านได้',
      name: 'kycLevel1FailedContent',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน\n%ระดับ 1 สำเร็จ%`
  String get kycLevel1SuccessContent {
    return Intl.message(
      'ยืนยันตัวตน\n%ระดับ 1 สำเร็จ%',
      name: 'kycLevel1SuccessContent',
      desc: '',
      args: [],
    );
  }

  /// `กำลังตรวจสอบข้อมูลกรุณารอสักครู่`
  String get kycLevel1ProcessText {
    return Intl.message(
      'กำลังตรวจสอบข้อมูลกรุณารอสักครู่',
      name: 'kycLevel1ProcessText',
      desc: '',
      args: [],
    );
  }

  /// `ข้อกำหนด และ %เงื่อนไข%`
  String get kycTermHeadline {
    return Intl.message(
      'ข้อกำหนด และ %เงื่อนไข%',
      name: 'kycTermHeadline',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาอ่านและทำเครื่องหมายในช่องสี่เหลี่ยม`
  String get kycTermAcceptTitle {
    return Intl.message(
      'กรุณาอ่านและทำเครื่องหมายในช่องสี่เหลี่ยม',
      name: 'kycTermAcceptTitle',
      desc: '',
      args: [],
    );
  }

  /// `ข้าพเจ้าได้อ่านข้อกำหนดและเงื่อนไขต่างๆ นี้แล้ว และตกลงยินยอมที่จะทำตามเงื่อนไขตามที่กำหนดไว้\nทุกประการ ข้าพเจ้าเข้าใจความเสี่ยงที่เกี่ยวข้องกับการลงทุนในผลิตภัณฑ์ต่างๆ แล้วข้าพเจ้ายืนยันว่า\nข้าพเจ้าเป็นเจ้าของบัญชีที่แท้จริงและไม่ได้เปิดบัญชีแทนบุคคลอื่นแต่อย่างใด ข้อมูลที่ข้าพเจ้ากรอกทั้งหมดนี้ถูกต้องและเป็นความจริง เมื่อใดที่ข้อมูลข้าพเจ้าเปลี่ยนแปลง ข้าพเจ้าจะแจ้ง GASTA เป็นลายลักษณ์อักษรโดยพลัน`
  String get kycTermAcceptDetail {
    return Intl.message(
      'ข้าพเจ้าได้อ่านข้อกำหนดและเงื่อนไขต่างๆ นี้แล้ว และตกลงยินยอมที่จะทำตามเงื่อนไขตามที่กำหนดไว้\nทุกประการ ข้าพเจ้าเข้าใจความเสี่ยงที่เกี่ยวข้องกับการลงทุนในผลิตภัณฑ์ต่างๆ แล้วข้าพเจ้ายืนยันว่า\nข้าพเจ้าเป็นเจ้าของบัญชีที่แท้จริงและไม่ได้เปิดบัญชีแทนบุคคลอื่นแต่อย่างใด ข้อมูลที่ข้าพเจ้ากรอกทั้งหมดนี้ถูกต้องและเป็นความจริง เมื่อใดที่ข้อมูลข้าพเจ้าเปลี่ยนแปลง ข้าพเจ้าจะแจ้ง GASTA เป็นลายลักษณ์อักษรโดยพลัน',
      name: 'kycTermAcceptDetail',
      desc: '',
      args: [],
    );
  }

  /// `ข้อตกลงการยืนยันตัวตน\n%ผ่านบริการของ NDID%`
  String get kycNdidTermHeadline {
    return Intl.message(
      'ข้อตกลงการยืนยันตัวตน\n%ผ่านบริการของ NDID%',
      name: 'kycNdidTermHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Scan Document`
  String get kycSelfieIntroNavTitle {
    return Intl.message(
      'Scan Document',
      name: 'kycSelfieIntroNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายภาพใบหน้า`
  String get kycSelfieIntroButtonText {
    return Intl.message(
      'ถ่ายภาพใบหน้า',
      name: 'kycSelfieIntroButtonText',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายภาพใบหน้า`
  String get captureFaceNavTitle {
    return Intl.message(
      'ถ่ายภาพใบหน้า',
      name: 'captureFaceNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ขั้นตอนในการยืนยันตัวตน`
  String get ndidIntroHeadline {
    return Intl.message(
      'ขั้นตอนในการยืนยันตัวตน',
      name: 'ndidIntroHeadline',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาชําระค่าดำเนินการยืนยันตัวตน 130 บาท ภายใน 15 นาที`
  String get ndidIntroStep1 {
    return Intl.message(
      'กรุณาชําระค่าดำเนินการยืนยันตัวตน 130 บาท ภายใน 15 นาที',
      name: 'ndidIntroStep1',
      desc: '',
      args: [],
    );
  }

  /// `หลังชําระค่าดำเนินการยืนยันตัวตนเรียบร้อยแล้ว กรุณายืนยันตัวตนผ่านแอปพลิเคชัน ภายใน %60 นาที%`
  String get ndidIntroStep2 {
    return Intl.message(
      'หลังชําระค่าดำเนินการยืนยันตัวตนเรียบร้อยแล้ว กรุณายืนยันตัวตนผ่านแอปพลิเคชัน ภายใน %60 นาที%',
      name: 'ndidIntroStep2',
      desc: '',
      args: [],
    );
  }

  /// `หากยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด ท่านสามารถ%ยืนยันตัวตนช่องทางแอปพลิเคชันได้อีก 1 ครั้ง%`
  String get ndidIntroStep3 {
    return Intl.message(
      'หากยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด ท่านสามารถ%ยืนยันตัวตนช่องทางแอปพลิเคชันได้อีก 1 ครั้ง%',
      name: 'ndidIntroStep3',
      desc: '',
      args: [],
    );
  }

  /// `หากท่านยืนยันตัวตนไม่สำเร็จในครั้งที่ 2 ระบบจะยกเลิกการยืนยันตัวตน %ท่านต้องเริ่มกระบวนการยืนยันตัวตนใหม่และชําระค่าธรรมเนียมใหม่อีกครั้ง%`
  String get ndidIntroStep4 {
    return Intl.message(
      'หากท่านยืนยันตัวตนไม่สำเร็จในครั้งที่ 2 ระบบจะยกเลิกการยืนยันตัวตน %ท่านต้องเริ่มกระบวนการยืนยันตัวตนใหม่และชําระค่าธรรมเนียมใหม่อีกครั้ง%',
      name: 'ndidIntroStep4',
      desc: '',
      args: [],
    );
  }

  /// `ระบบจะทําการคืนค่าธรรมเนียมของรายการที่ยืนยันตัวตนไม่สำเร็จในครั้งที่ 2 เป็น voucher ทันที มีทางเลือกในการคืน คือ \n1. Cash โอนเข้าบัญชีภายใน 15 วันทําการ \n2. GASTH Token (คํานวณ rate ณ วันที่กดใช้ voucher)`
  String get ndidIntroStep5 {
    return Intl.message(
      'ระบบจะทําการคืนค่าธรรมเนียมของรายการที่ยืนยันตัวตนไม่สำเร็จในครั้งที่ 2 เป็น voucher ทันที มีทางเลือกในการคืน คือ \n1. Cash โอนเข้าบัญชีภายใน 15 วันทําการ \n2. GASTH Token (คํานวณ rate ณ วันที่กดใช้ voucher)',
      name: 'ndidIntroStep5',
      desc: '',
      args: [],
    );
  }

  /// `สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net`
  String get ndidIntroContact {
    return Intl.message(
      'สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net',
      name: 'ndidIntroContact',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาชำระ\n%ค่าดำเนินการยืนยันตัวตน%`
  String get ndidPaymentHeadline {
    return Intl.message(
      'กรุณาชำระ\n%ค่าดำเนินการยืนยันตัวตน%',
      name: 'ndidPaymentHeadline',
      desc: '',
      args: [],
    );
  }

  /// `QR Promptpay`
  String get qrPromptpayText {
    return Intl.message(
      'QR Promptpay',
      name: 'qrPromptpayText',
      desc: '',
      args: [],
    );
  }

  /// `ชำระด้วย GASTH`
  String get gastaPaymentText {
    return Intl.message(
      'ชำระด้วย GASTH',
      name: 'gastaPaymentText',
      desc: '',
      args: [],
    );
  }

  /// `The Order will be cancelled if you don’t pay with in`
  String get paymentWarning1Text {
    return Intl.message(
      'The Order will be cancelled if you don’t pay with in',
      name: 'paymentWarning1Text',
      desc: '',
      args: [],
    );
  }

  /// `%Use your own bank account to make payment.% Otherwise , your order may be cancelled.`
  String get paymentWarning2Text {
    return Intl.message(
      '%Use your own bank account to make payment.% Otherwise , your order may be cancelled.',
      name: 'paymentWarning2Text',
      desc: '',
      args: [],
    );
  }

  /// `Due On`
  String get dueText {
    return Intl.message(
      'Due On',
      name: 'dueText',
      desc: '',
      args: [],
    );
  }

  /// `สถานะการชำระ`
  String get paymentStatusText {
    return Intl.message(
      'สถานะการชำระ',
      name: 'paymentStatusText',
      desc: '',
      args: [],
    );
  }

  /// `รอชำระเงิน`
  String get paymentPendingText {
    return Intl.message(
      'รอชำระเงิน',
      name: 'paymentPendingText',
      desc: '',
      args: [],
    );
  }

  /// `You will pay`
  String get paymentYouWillPayText {
    return Intl.message(
      'You will pay',
      name: 'paymentYouWillPayText',
      desc: '',
      args: [],
    );
  }

  /// `จำนวนเงิน`
  String get paymentAmountText {
    return Intl.message(
      'จำนวนเงิน',
      name: 'paymentAmountText',
      desc: '',
      args: [],
    );
  }

  /// `Address name`
  String get paymentGastaAddressNameText {
    return Intl.message(
      'Address name',
      name: 'paymentGastaAddressNameText',
      desc: '',
      args: [],
    );
  }

  /// `ค่าดำเนินการยืนยันตัวตน`
  String get paymentNdidServiceFeeText {
    return Intl.message(
      'ค่าดำเนินการยืนยันตัวตน',
      name: 'paymentNdidServiceFeeText',
      desc: '',
      args: [],
    );
  }

  /// `Transfer fee`
  String get paymentTransferFeeText {
    return Intl.message(
      'Transfer fee',
      name: 'paymentTransferFeeText',
      desc: '',
      args: [],
    );
  }

  /// `You may be charged transfer  fee 0.3% from GASTA network.`
  String get paymentTransferFeeWarningText {
    return Intl.message(
      'You may be charged transfer  fee 0.3% from GASTA network.',
      name: 'paymentTransferFeeWarningText',
      desc: '',
      args: [],
    );
  }

  /// `Network fee`
  String get paymentNetworkFeeText {
    return Intl.message(
      'Network fee',
      name: 'paymentNetworkFeeText',
      desc: '',
      args: [],
    );
  }

  /// `You may be charged network  fee 0.500000 GASTA as Ethereum Gas Fee.`
  String get paymentNetworkFeeWarningText {
    return Intl.message(
      'You may be charged network  fee 0.500000 GASTA as Ethereum Gas Fee.',
      name: 'paymentNetworkFeeWarningText',
      desc: '',
      args: [],
    );
  }

  /// `Promotion`
  String get paymentPromotionText {
    return Intl.message(
      'Promotion',
      name: 'paymentPromotionText',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get paymentTotalAmount {
    return Intl.message(
      'Total amount',
      name: 'paymentTotalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get paymentPaynowButtonText {
    return Intl.message(
      'Pay Now',
      name: 'paymentPaynowButtonText',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกการชำระเงิน`
  String get ndidPaymentCancellationTitle {
    return Intl.message(
      'ยกเลิกการชำระเงิน',
      name: 'ndidPaymentCancellationTitle',
      desc: '',
      args: [],
    );
  }

  /// `ท่านต้องการยกเลิกการชำระค่าดำเนินการยืนยันตัวตน ใช่หรือไม่`
  String get ndidPaymentCancellationDesc {
    return Intl.message(
      'ท่านต้องการยกเลิกการชำระค่าดำเนินการยืนยันตัวตน ใช่หรือไม่',
      name: 'ndidPaymentCancellationDesc',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกการชำระ`
  String get ndidPaymentCancellationSubmitButton {
    return Intl.message(
      'ยกเลิกการชำระ',
      name: 'ndidPaymentCancellationSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `ย้อนกลับ`
  String get ndidPaymentCancellationReturnButton {
    return Intl.message(
      'ย้อนกลับ',
      name: 'ndidPaymentCancellationReturnButton',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกผู้ให้บริการยืนยันตัวตนที่ท่านเคยลงทะเบียนไว้เพื่อยืนยัน ตัวตน %และ มีโมบายแอปพลิเคชัน ของผู้ให้บริการยืนยันตัวตนดัง กล่าว%`
  String get bankNdidHeadline {
    return Intl.message(
      'กรุณาเลือกผู้ให้บริการยืนยันตัวตนที่ท่านเคยลงทะเบียนไว้เพื่อยืนยัน ตัวตน %และ มีโมบายแอปพลิเคชัน ของผู้ให้บริการยืนยันตัวตนดัง กล่าว%',
      name: 'bankNdidHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ผู้ให้บริการยืนยันตัวตนที่ท่านได้ลงทะเบียน NDID ไว้แล้ว สามารถยืนยันตัวตนได้ที่`
  String get bankNdidExpandHeadline1 {
    return Intl.message(
      'ผู้ให้บริการยืนยันตัวตนที่ท่านได้ลงทะเบียน NDID ไว้แล้ว สามารถยืนยันตัวตนได้ที่',
      name: 'bankNdidExpandHeadline1',
      desc: '',
      args: [],
    );
  }

  /// `ผู้ให้บริการยืนยันตัวตนที่นำท่านให้ลงทะเบียน NDID ก่อน จากนั้นจึงยืนยันตัวตนได้`
  String get bankNdidExpandHeadline2 {
    return Intl.message(
      'ผู้ให้บริการยืนยันตัวตนที่นำท่านให้ลงทะเบียน NDID ก่อน จากนั้นจึงยืนยันตัวตนได้',
      name: 'bankNdidExpandHeadline2',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย ท่านไม่สามารถใช้บริการได้ กรุณาติดต่อผู้ให้บริการยืนยันตัวตนเพื่อทำการลงทะเบียนบริการ NDID ก่อนการใช้บริการ`
  String get bankNdidCannotRegister {
    return Intl.message(
      'ขออภัย ท่านไม่สามารถใช้บริการได้ กรุณาติดต่อผู้ให้บริการยืนยันตัวตนเพื่อทำการลงทะเบียนบริการ NDID ก่อนการใช้บริการ',
      name: 'bankNdidCannotRegister',
      desc: '',
      args: [],
    );
  }

  /// `ท่านยังไม่เคยลงทะเบียนบริการ NDID`
  String get bankNdidNeverRegister {
    return Intl.message(
      'ท่านยังไม่เคยลงทะเบียนบริการ NDID',
      name: 'bankNdidNeverRegister',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกผู้ให้บริการยืนยันตัวตนที่ท่านต้องการลงทะเบียนบริการ NDID (ท่านต้องมีโมบายแอปพลิเคชันกับผู้ให้บริการ ยืนยันตัวตนดังกล่าวอยู่แล้ว)`
  String get bankNdidUnregister {
    return Intl.message(
      'กรุณาเลือกผู้ให้บริการยืนยันตัวตนที่ท่านต้องการลงทะเบียนบริการ NDID (ท่านต้องมีโมบายแอปพลิเคชันกับผู้ให้บริการ ยืนยันตัวตนดังกล่าวอยู่แล้ว)',
      name: 'bankNdidUnregister',
      desc: '',
      args: [],
    );
  }

  /// `ท่านกำลังยืนยันตัวตนเพื่อใช้ตาม วัตถุประสงค์ของ %บริษัท 1109 พรอส์เปอร์ จำกัด และประสงค์ ให้ส่งข้อมูลจาก [idp]%`
  String get bankNdidWaitingHeadline {
    return Intl.message(
      'ท่านกำลังยืนยันตัวตนเพื่อใช้ตาม วัตถุประสงค์ของ %บริษัท 1109 พรอส์เปอร์ จำกัด และประสงค์ ให้ส่งข้อมูลจาก [idp]%',
      name: 'bankNdidWaitingHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ท่านกําลังยืนยันตัวตนโดยแสดงบัตรประจําตัวประชาชน ณ จุดให้บริการ ของ [idp] %เพื่อใช้ตามวัตถุ ประสงค์ของ บริษัท 1109 พรอส์เปอร์ จำกัด%`
  String get agentNdidWatingHeadline {
    return Intl.message(
      'ท่านกําลังยืนยันตัวตนโดยแสดงบัตรประจําตัวประชาชน ณ จุดให้บริการ ของ [idp] %เพื่อใช้ตามวัตถุ ประสงค์ของ บริษัท 1109 พรอส์เปอร์ จำกัด%',
      name: 'agentNdidWatingHeadline',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาไปยืนยันตัวตนที่โมบายแอปพลิเคชันของ ผู้ให้บริการยืนยันตัวตนที่ท่านเลือกภายใน 60 นาทีและกลับมาทำรายการต่อที่นี่`
  String get bankNdidWaitingDesc {
    return Intl.message(
      'กรุณาไปยืนยันตัวตนที่โมบายแอปพลิเคชันของ ผู้ให้บริการยืนยันตัวตนที่ท่านเลือกภายใน 60 นาทีและกลับมาทำรายการต่อที่นี่',
      name: 'bankNdidWaitingDesc',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาไปแสดงตัวตน ณ จุดให้บริการของผู้ให้บริการยืนยันตัวตนที่ท่านเลือกภายใน 24 ชั่วโมงและกลับมาทํารายการต่อที่นี่`
  String get agentNdidWAtingDesc {
    return Intl.message(
      'กรุณาไปแสดงตัวตน ณ จุดให้บริการของผู้ให้บริการยืนยันตัวตนที่ท่านเลือกภายใน 24 ชั่วโมงและกลับมาทํารายการต่อที่นี่',
      name: 'agentNdidWAtingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Ref:`
  String get bankNdidRefLabel {
    return Intl.message(
      'Transaction Ref:',
      name: 'bankNdidRefLabel',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตนภายในเวลา`
  String get bankNdidVerifyIn {
    return Intl.message(
      'ยืนยันตัวตนภายในเวลา',
      name: 'bankNdidVerifyIn',
      desc: '',
      args: [],
    );
  }

  /// `หากต้องการยกเลิกการยืนยันตัวตนหรือเปลี่ยนช่องทางการยืนยันตัวตน กรุณาคลิก "ยกเลิกการยืนยันตัวตน"`
  String get bankNdidInfoCancellation {
    return Intl.message(
      'หากต้องการยกเลิกการยืนยันตัวตนหรือเปลี่ยนช่องทางการยืนยันตัวตน กรุณาคลิก "ยกเลิกการยืนยันตัวตน"',
      name: 'bankNdidInfoCancellation',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกการยืนยันตัวตน`
  String get bankNdidCancellationButton {
    return Intl.message(
      'ยกเลิกการยืนยันตัวตน',
      name: 'bankNdidCancellationButton',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกผู้ให้บริการยืนยันตัวตน %โดยแสดงบัตรประจำตัวประชาชน%`
  String get dealerNdidHeader {
    return Intl.message(
      'กรุณาเลือกผู้ให้บริการยืนยันตัวตน %โดยแสดงบัตรประจำตัวประชาชน%',
      name: 'dealerNdidHeader',
      desc: '',
      args: [],
    );
  }

  /// `ค้นหาจุดบริการใกล้ฉัน`
  String get dealerNdidFindButton {
    return Intl.message(
      'ค้นหาจุดบริการใกล้ฉัน',
      name: 'dealerNdidFindButton',
      desc: '',
      args: [],
    );
  }

  /// `หากอยู่ที่จุดให้บริการแล้ว กรุณาคลิก "ดำเนินการยืนยันตัวตน"`
  String get dealerNdidInfo {
    return Intl.message(
      'หากอยู่ที่จุดให้บริการแล้ว กรุณาคลิก "ดำเนินการยืนยันตัวตน"',
      name: 'dealerNdidInfo',
      desc: '',
      args: [],
    );
  }

  /// `สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net`
  String get dealerNdidContactInfo {
    return Intl.message(
      'สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net',
      name: 'dealerNdidContactInfo',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตนผู้ใช้งาน\n%สำเร็จ%`
  String get kycSuccessHeadline {
    return Intl.message(
      'ยืนยันตัวตนผู้ใช้งาน\n%สำเร็จ%',
      name: 'kycSuccessHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Ref:`
  String get kycSuccessRef {
    return Intl.message(
      'Transaction Ref:',
      name: 'kycSuccessRef',
      desc: '',
      args: [],
    );
  }

  /// `Order %Cancelled%`
  String get ndidPaymentFailedHeader {
    return Intl.message(
      'Order %Cancelled%',
      name: 'ndidPaymentFailedHeader',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Id :`
  String get ndidPaymentFailedRef {
    return Intl.message(
      'Transaction Id :',
      name: 'ndidPaymentFailedRef',
      desc: '',
      args: [],
    );
  }

  /// `Your Order has been cancelled`
  String get ndidPaymentFailedCancelSection {
    return Intl.message(
      'Your Order has been cancelled',
      name: 'ndidPaymentFailedCancelSection',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation reason`
  String get ndidPaymentFailedCancelReasonLabel {
    return Intl.message(
      'Cancellation reason',
      name: 'ndidPaymentFailedCancelReasonLabel',
      desc: '',
      args: [],
    );
  }

  /// `ค่าดำเนินการยืนยันตัวตน`
  String get ndidPaymentFailedServiceFeeLabel {
    return Intl.message(
      'ค่าดำเนินการยืนยันตัวตน',
      name: 'ndidPaymentFailedServiceFeeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Promotion`
  String get ndidPaymentFailedPromotionLabel {
    return Intl.message(
      'Promotion',
      name: 'ndidPaymentFailedPromotionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get ndidPaymentFailedTotalLabel {
    return Intl.message(
      'Total amount',
      name: 'ndidPaymentFailedTotalLabel',
      desc: '',
      args: [],
    );
  }

  /// `วิธีชำระเงิน`
  String get ndidPaymentFailedHowToLabel {
    return Intl.message(
      'วิธีชำระเงิน',
      name: 'ndidPaymentFailedHowToLabel',
      desc: '',
      args: [],
    );
  }

  /// `ท่านต้องการชำระอีกครั้งหรือยกเลิกเพื่อเลือกช่องทางยืนยันตัวตนใหม่`
  String get ndidPaymentFailedTryAgainLabel {
    return Intl.message(
      'ท่านต้องการชำระอีกครั้งหรือยกเลิกเพื่อเลือกช่องทางยืนยันตัวตนใหม่',
      name: 'ndidPaymentFailedTryAgainLabel',
      desc: '',
      args: [],
    );
  }

  /// `Order Completed`
  String get ndidPaymentSuccessHeadline {
    return Intl.message(
      'Order Completed',
      name: 'ndidPaymentSuccessHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Id :`
  String get ndidPaymentSuccessRef {
    return Intl.message(
      'Transaction Id :',
      name: 'ndidPaymentSuccessRef',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get ndidPaymentSuccessTotalLabel {
    return Intl.message(
      'Total amount',
      name: 'ndidPaymentSuccessTotalLabel',
      desc: '',
      args: [],
    );
  }

  /// `ค่าดำเนินการยืนยันตัวตน`
  String get ndidPaymentSuccessServiceFeeLabel {
    return Intl.message(
      'ค่าดำเนินการยืนยันตัวตน',
      name: 'ndidPaymentSuccessServiceFeeLabel',
      desc: '',
      args: [],
    );
  }

  /// `วิธีชำระเงิน`
  String get ndidPaymentSuccessHowToLabel {
    return Intl.message(
      'วิธีชำระเงิน',
      name: 'ndidPaymentSuccessHowToLabel',
      desc: '',
      args: [],
    );
  }

  /// `Scan for verification`
  String get ndidPaymentSuccessScan {
    return Intl.message(
      'Scan for verification',
      name: 'ndidPaymentSuccessScan',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยัน%ข้อมูล%`
  String get kycInformationSummaryHeadline {
    return Intl.message(
      'ยืนยัน%ข้อมูล%',
      name: 'kycInformationSummaryHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ตามบัตรประชาชน`
  String get kycInformationSummarySection1 {
    return Intl.message(
      'ที่อยู่ตามบัตรประชาชน',
      name: 'kycInformationSummarySection1',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ปัจจุบัน`
  String get kycInformationSummarySection2 {
    return Intl.message(
      'ที่อยู่ปัจจุบัน',
      name: 'kycInformationSummarySection2',
      desc: '',
      args: [],
    );
  }

  /// `อาชีพ %ปัจจุบัน%`
  String get kycInformationSummarySection3 {
    return Intl.message(
      'อาชีพ %ปัจจุบัน%',
      name: 'kycInformationSummarySection3',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ที่ทำงาน`
  String get kycInformationSummarySection4 {
    return Intl.message(
      'ที่อยู่ที่ทำงาน',
      name: 'kycInformationSummarySection4',
      desc: '',
      args: [],
    );
  }

  /// `พระราชบัญญัติการปฏิบัติตาม ภาษีบัญชีต่างประเทศ (FATCA)`
  String get kycInformationSummarySection5 {
    return Intl.message(
      'พระราชบัญญัติการปฏิบัติตาม ภาษีบัญชีต่างประเทศ (FATCA)',
      name: 'kycInformationSummarySection5',
      desc: '',
      args: [],
    );
  }

  /// `หลักฐานการได้มาซึ่งรายได้`
  String get kycInformationSummarySection6 {
    return Intl.message(
      'หลักฐานการได้มาซึ่งรายได้',
      name: 'kycInformationSummarySection6',
      desc: '',
      args: [],
    );
  }

  /// `หลักฐานการถือครองสินทรัพย์`
  String get kycInformationSummarySection7 {
    return Intl.message(
      'หลักฐานการถือครองสินทรัพย์',
      name: 'kycInformationSummarySection7',
      desc: '',
      args: [],
    );
  }

  /// `อาชีพปัจจุบัน`
  String get kycInformationSummarySection3Label1 {
    return Intl.message(
      'อาชีพปัจจุบัน',
      name: 'kycInformationSummarySection3Label1',
      desc: '',
      args: [],
    );
  }

  /// `ช่วงของรายได้`
  String get kycInformationSummarySection3Label2 {
    return Intl.message(
      'ช่วงของรายได้',
      name: 'kycInformationSummarySection3Label2',
      desc: '',
      args: [],
    );
  }

  /// `สถานที่ทำงาน`
  String get kycInformationSummarySection3Label3 {
    return Intl.message(
      'สถานที่ทำงาน',
      name: 'kycInformationSummarySection3Label3',
      desc: '',
      args: [],
    );
  }

  /// `อาชีพอื่นที่ทำรายได้สูงสุด`
  String get kycInformationSummarySection3Label4 {
    return Intl.message(
      'อาชีพอื่นที่ทำรายได้สูงสุด',
      name: 'kycInformationSummarySection3Label4',
      desc: '',
      args: [],
    );
  }

  /// `ช่วงของรายได้ อาชีพอื่นที่ทำรายได้สูงสุด (ต่อเดือน)`
  String get kycInformationSummarySection3Label5 {
    return Intl.message(
      'ช่วงของรายได้ อาชีพอื่นที่ทำรายได้สูงสุด (ต่อเดือน)',
      name: 'kycInformationSummarySection3Label5',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันการชำระเงิน`
  String get paymentConfirmationTitle {
    return Intl.message(
      'ยืนยันการชำระเงิน',
      name: 'paymentConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `ท่านต้องการชำระค่าดำเนินการยืนยันตัวตน ด้วย GASTH ใช่หรือไม่`
  String get paymentConfirmationNdidDescription {
    return Intl.message(
      'ท่านต้องการชำระค่าดำเนินการยืนยันตัวตน ด้วย GASTH ใช่หรือไม่',
      name: 'paymentConfirmationNdidDescription',
      desc: '',
      args: [],
    );
  }

  /// `Announcement & Promos`
  String get homeSectionAnnoucement {
    return Intl.message(
      'Announcement & Promos',
      name: 'homeSectionAnnoucement',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get homeSectionNews {
    return Intl.message(
      'News',
      name: 'homeSectionNews',
      desc: '',
      args: [],
    );
  }

  /// `บริการเพิ่มเติม`
  String get homeSectionServices {
    return Intl.message(
      'บริการเพิ่มเติม',
      name: 'homeSectionServices',
      desc: '',
      args: [],
    );
  }

  /// `ยกเลิกการยืนยันตัวตน`
  String get ndidWaitingCancelTitle {
    return Intl.message(
      'ยกเลิกการยืนยันตัวตน',
      name: 'ndidWaitingCancelTitle',
      desc: '',
      args: [],
    );
  }

  /// `คุณต้องการยกเลิกการยืนยันตัวตนใช่หรือไม่ ?`
  String get ndidWaitingDesc {
    return Intl.message(
      'คุณต้องการยกเลิกการยืนยันตัวตนใช่หรือไม่ ?',
      name: 'ndidWaitingDesc',
      desc: '',
      args: [],
    );
  }

  /// `ระบบจะทําการคืนค่าธรรมเนียมเป็น voucher มีทางเลือกในการคืน\n(1) Cash โอนเข้าบัญชีภายใน 15 วันทําการ\n(2) GASTH Token (คํานวณ rate ณ วันที่กดใช้ voucher)\nกรุณาตรวจสอบที่ My voucher`
  String get ndid2ndCancelRefundDesc {
    return Intl.message(
      'ระบบจะทําการคืนค่าธรรมเนียมเป็น voucher มีทางเลือกในการคืน\n(1) Cash โอนเข้าบัญชีภายใน 15 วันทําการ\n(2) GASTH Token (คํานวณ rate ณ วันที่กดใช้ voucher)\nกรุณาตรวจสอบที่ My voucher',
      name: 'ndid2ndCancelRefundDesc',
      desc: '',
      args: [],
    );
  }

  /// `หากท่านยกเลิกการยืนยันตัวตน\nคำขอยืนยันตัวตนนี้จะไม่สามารถใช้งานได้อีก`
  String get ndidCancelTitle {
    return Intl.message(
      'หากท่านยกเลิกการยืนยันตัวตน\nคำขอยืนยันตัวตนนี้จะไม่สามารถใช้งานได้อีก',
      name: 'ndidCancelTitle',
      desc: '',
      args: [],
    );
  }

  /// `หากท่านยกเลิกการยืนยันตัวตน\nคำขอยืนยันตัวตนนี้จะไม่สามารถใช้งานได้อีก`
  String get ndidCancel2ndTitle {
    return Intl.message(
      'หากท่านยกเลิกการยืนยันตัวตน\nคำขอยืนยันตัวตนนี้จะไม่สามารถใช้งานได้อีก',
      name: 'ndidCancel2ndTitle',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน ระดับ2\n%ไม่สำเร็จ%`
  String get ndidFailedTitle {
    return Intl.message(
      'ยืนยันตัวตน ระดับ2\n%ไม่สำเร็จ%',
      name: 'ndidFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `ปฏิเสธการยอมรับเงื่อนไขการใช้บริการ`
  String get ndidTermCancelDialogTitle {
    return Intl.message(
      'ปฏิเสธการยอมรับเงื่อนไขการใช้บริการ',
      name: 'ndidTermCancelDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `หากคุณ ปฏิเสธ การยอมรับเงื่อนไขการให้บริการ จะไม่สามารถดำเนินการยืนยันตัวตนต่อได้ คุณต้องการยกเลิกหรือไม่?`
  String get ndidTermCancelDialogDesc {
    return Intl.message(
      'หากคุณ ปฏิเสธ การยอมรับเงื่อนไขการให้บริการ จะไม่สามารถดำเนินการยืนยันตัวตนต่อได้ คุณต้องการยกเลิกหรือไม่?',
      name: 'ndidTermCancelDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `ท่านยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด ท่านสามารถเลือกผู้ให้บริการยืนยันตัวตนช่องทางแอปพลิเคชันได้อีก 1 ครั้ง โดยไม่ต้องชําระค่าธรรมเนียมใหม่กรุณาเลือก`
  String get ndidFailedIDpDesc {
    return Intl.message(
      'ท่านยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด ท่านสามารถเลือกผู้ให้บริการยืนยันตัวตนช่องทางแอปพลิเคชันได้อีก 1 ครั้ง โดยไม่ต้องชําระค่าธรรมเนียมใหม่กรุณาเลือก',
      name: 'ndidFailedIDpDesc',
      desc: '',
      args: [],
    );
  }

  /// `ท่านยืนยันตัวตนไม่สําเร็จในครั้งที่ 2 ระบบจะยกเลิกการยืนยันตัวตน ท่านต้องเริ่มกระบวนการยืนยันตัวตนใหม่และชําระค่าธรรมเนียมใหม่อีกครั้ง`
  String get ndidFailedIdpFinalDesc {
    return Intl.message(
      'ท่านยืนยันตัวตนไม่สําเร็จในครั้งที่ 2 ระบบจะยกเลิกการยืนยันตัวตน ท่านต้องเริ่มกระบวนการยืนยันตัวตนใหม่และชําระค่าธรรมเนียมใหม่อีกครั้ง',
      name: 'ndidFailedIdpFinalDesc',
      desc: '',
      args: [],
    );
  }

  /// `ท่านได้ปฏิเสธการยืนยันตัวตนของผู้ให้บริการยืนยันตัวตนที่ท่านเลือก กรุณาทำรายการใหม่หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น`
  String get ndidFailedTimeoutDesc {
    return Intl.message(
      'ท่านได้ปฏิเสธการยืนยันตัวตนของผู้ให้บริการยืนยันตัวตนที่ท่านเลือก กรุณาทำรายการใหม่หรือเลือกผู้ให้บริการยืนยันตัวตนรายอื่น',
      name: 'ndidFailedTimeoutDesc',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buyGovernmentTokenTitle {
    return Intl.message(
      'Buy',
      name: 'buyGovernmentTokenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get sellGovernmentTokenTitle {
    return Intl.message(
      'Sell',
      name: 'sellGovernmentTokenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get min {
    return Intl.message(
      'Min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get max {
    return Intl.message(
      'Max',
      name: 'max',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get sell {
    return Intl.message(
      'Sell',
      name: 'sell',
      desc: '',
      args: [],
    );
  }

  /// `Approx`
  String get equalTo {
    return Intl.message(
      'Approx',
      name: 'equalTo',
      desc: '',
      args: [],
    );
  }

  /// `Amount exceeds the available amount / daily buy limit.`
  String get overBuyLimitError {
    return Intl.message(
      'Amount exceeds the available amount / daily buy limit.',
      name: 'overBuyLimitError',
      desc: '',
      args: [],
    );
  }

  /// `The minimum purchase is 100 THB`
  String get lessThanMinError {
    return Intl.message(
      'The minimum purchase is 100 THB',
      name: 'lessThanMinError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm %Order%`
  String get confirmOrderTitle {
    return Intl.message(
      'Confirm %Order%',
      name: 'confirmOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `จ่าย`
  String get pay {
    return Intl.message(
      'จ่าย',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `รับ`
  String get recieve {
    return Intl.message(
      'รับ',
      name: 'recieve',
      desc: '',
      args: [],
    );
  }

  /// `GASTH Price`
  String get gasthPrice {
    return Intl.message(
      'GASTH Price',
      name: 'gasthPrice',
      desc: '',
      args: [],
    );
  }

  /// `THB Amount`
  String get thbAmount {
    return Intl.message(
      'THB Amount',
      name: 'thbAmount',
      desc: '',
      args: [],
    );
  }

  /// `Transaction fee`
  String get transactionFee {
    return Intl.message(
      'Transaction fee',
      name: 'transactionFee',
      desc: '',
      args: [],
    );
  }

  /// `วิธีชำระเงิน`
  String get howtoPay {
    return Intl.message(
      'วิธีชำระเงิน',
      name: 'howtoPay',
      desc: '',
      args: [],
    );
  }

  /// `GASTA Voucher`
  String get gasthVoucher {
    return Intl.message(
      'GASTA Voucher',
      name: 'gasthVoucher',
      desc: '',
      args: [],
    );
  }

  /// `บันทึกช่วยจำ`
  String get note {
    return Intl.message(
      'บันทึกช่วยจำ',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment`
  String get selectPayment {
    return Intl.message(
      'Select Payment',
      name: 'selectPayment',
      desc: '',
      args: [],
    );
  }

  /// `Select Voucher`
  String get selectVoucher {
    return Intl.message(
      'Select Voucher',
      name: 'selectVoucher',
      desc: '',
      args: [],
    );
  }

  /// `โปรดอ่านและยอมรับเงื่อนไขการชำระเงินทั้งหมด`
  String get confirmPaymentConditionTitle {
    return Intl.message(
      'โปรดอ่านและยอมรับเงื่อนไขการชำระเงินทั้งหมด',
      name: 'confirmPaymentConditionTitle',
      desc: '',
      args: [],
    );
  }

  /// `โอนจากบัญชีธนาคารที่ท่านเลือกซึ่งเป็นชื่อของท่านและผ่านการตรวจสอบแล้วเท่านั้น`
  String get confirmPaymentCondition1 {
    return Intl.message(
      'โอนจากบัญชีธนาคารที่ท่านเลือกซึ่งเป็นชื่อของท่านและผ่านการตรวจสอบแล้วเท่านั้น',
      name: 'confirmPaymentCondition1',
      desc: '',
      args: [],
    );
  }

  /// `โอนเงินตรงตามยอดที่ต้องชำระ`
  String get confirmPaymentCondition2 {
    return Intl.message(
      'โอนเงินตรงตามยอดที่ต้องชำระ',
      name: 'confirmPaymentCondition2',
      desc: '',
      args: [],
    );
  }

  /// `หากการชำระเงินไม่ตรงตามเงื่อนไข คำสั่งซื้อของท่านอาจถูกยกเลิก`
  String get confirmPaymentCondition3 {
    return Intl.message(
      'หากการชำระเงินไม่ตรงตามเงื่อนไข คำสั่งซื้อของท่านอาจถูกยกเลิก',
      name: 'confirmPaymentCondition3',
      desc: '',
      args: [],
    );
  }

  /// `เงื่อนไขเหล่านี้ คืออะไร?`
  String get whatIsCondition {
    return Intl.message(
      'เงื่อนไขเหล่านี้ คืออะไร?',
      name: 'whatIsCondition',
      desc: '',
      args: [],
    );
  }

  /// `You will pay`
  String get youWillPay {
    return Intl.message(
      'You will pay',
      name: 'youWillPay',
      desc: '',
      args: [],
    );
  }

  /// `บัญชีรับเงิน`
  String get recievedAccount {
    return Intl.message(
      'บัญชีรับเงิน',
      name: 'recievedAccount',
      desc: '',
      args: [],
    );
  }

  /// `ยอดขายไม่เกิน 100,000 บาท\nได้รับเงินภายใน 1 นาที - 24 ชั่วโมง\n\nยอดขายเกิน 100,000 บาท\nได้รับเงินภายใน 1 ชั่วโมง - 24 ชั่วโมง\n\nยอดขายสูงสุดได้ไม่เกิน ครั้งละ 2,000,000 บาท`
  String get sellHint {
    return Intl.message(
      'ยอดขายไม่เกิน 100,000 บาท\nได้รับเงินภายใน 1 นาที - 24 ชั่วโมง\n\nยอดขายเกิน 100,000 บาท\nได้รับเงินภายใน 1 ชั่วโมง - 24 ชั่วโมง\n\nยอดขายสูงสุดได้ไม่เกิน ครั้งละ 2,000,000 บาท',
      name: 'sellHint',
      desc: '',
      args: [],
    );
  }

  /// `ระบบไม่สามารถทำธุรกรรมเงินบาทได้ในช่วงเวลา 23.30 - 00.10 น.\nกรุณาทำรายการอีกครั้งนอกช่วงเวลาดังกล่าว`
  String get sellWarning {
    return Intl.message(
      'ระบบไม่สามารถทำธุรกรรมเงินบาทได้ในช่วงเวลา 23.30 - 00.10 น.\nกรุณาทำรายการอีกครั้งนอกช่วงเวลาดังกล่าว',
      name: 'sellWarning',
      desc: '',
      args: [],
    );
  }

  /// `You will get`
  String get youWillGet {
    return Intl.message(
      'You will get',
      name: 'youWillGet',
      desc: '',
      args: [],
    );
  }

  /// `Verify %Bank Account%`
  String get verifyBankAccountTitle {
    return Intl.message(
      'Verify %Bank Account%',
      name: 'verifyBankAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อบัญชี`
  String get verifyBankAccountNameLabel {
    return Intl.message(
      'ชื่อบัญชี',
      name: 'verifyBankAccountNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อสาขา`
  String get verifyBankAccountBranchLabel {
    return Intl.message(
      'ชื่อสาขา',
      name: 'verifyBankAccountBranchLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลขที่บัญชี`
  String get verifyBankAccountNumberLabel {
    return Intl.message(
      'เลขที่บัญชี',
      name: 'verifyBankAccountNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือกธนาคาร`
  String get verifyBankNameLabel {
    return Intl.message(
      'เลือกธนาคาร',
      name: 'verifyBankNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `แตะเพื่ออัปโหลดหน้าบัญชีธนาคาร`
  String get verifyBankAccountUploadDescription {
    return Intl.message(
      'แตะเพื่ออัปโหลดหน้าบัญชีธนาคาร',
      name: 'verifyBankAccountUploadDescription',
      desc: '',
      args: [],
    );
  }

  /// `เลือกรูปภาพ`
  String get verifyBankAccountUploadButton {
    return Intl.message(
      'เลือกรูปภาพ',
      name: 'verifyBankAccountUploadButton',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกธนาคาร`
  String get verifyBankNamePlaceholder {
    return Intl.message(
      'กรุณาเลือกธนาคาร',
      name: 'verifyBankNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %บัญชีธนาคาร%`
  String get selectBankTitle {
    return Intl.message(
      'เลือก %บัญชีธนาคาร%',
      name: 'selectBankTitle',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %บัญชีโอนเงิน%`
  String get selectPaymentTitle {
    return Intl.message(
      'เลือก %บัญชีโอนเงิน%',
      name: 'selectPaymentTitle',
      desc: '',
      args: [],
    );
  }

  /// `เลือกวิธีการชำระเงิน`
  String get selectPaymentDropdownLabel {
    return Intl.message(
      'เลือกวิธีการชำระเงิน',
      name: 'selectPaymentDropdownLabel',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกวิธีชำระเงิน`
  String get selectPaymentDropdownPlaceholder {
    return Intl.message(
      'กรุณาเลือกวิธีชำระเงิน',
      name: 'selectPaymentDropdownPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาโอนเงินจากบัญชีธนาคารที่ท่านเลือกและได้รับการยืนยันจากเจ้าหน้าที่แล้วเท่านั้น`
  String get selectPaymentHint {
    return Intl.message(
      'กรุณาโอนเงินจากบัญชีธนาคารที่ท่านเลือกและได้รับการยืนยันจากเจ้าหน้าที่แล้วเท่านั้น',
      name: 'selectPaymentHint',
      desc: '',
      args: [],
    );
  }

  /// `เลือกบัญชีธนาคาร`
  String get selectPaymentListTitle {
    return Intl.message(
      'เลือกบัญชีธนาคาร',
      name: 'selectPaymentListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Verify Bank Account`
  String get selectPaymentAddBankButton {
    return Intl.message(
      'Add Verify Bank Account',
      name: 'selectPaymentAddBankButton',
      desc: '',
      args: [],
    );
  }

  /// `ท่านยังไม่ได้ยืนยันบัญชีธนาคาร กรุณาเพิ่มบัญชีที่เป็นชื่อของท่านอย่างน้อย 1 บัญชี ก่อนการชำระเงิน`
  String get selectPaymentEmptyState {
    return Intl.message(
      'ท่านยังไม่ได้ยืนยันบัญชีธนาคาร กรุณาเพิ่มบัญชีที่เป็นชื่อของท่านอย่างน้อย 1 บัญชี ก่อนการชำระเงิน',
      name: 'selectPaymentEmptyState',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %วิธีชำระเงิน%`
  String get dropdownPaymentTitle {
    return Intl.message(
      'เลือก %วิธีชำระเงิน%',
      name: 'dropdownPaymentTitle',
      desc: '',
      args: [],
    );
  }

  /// `QR พร้อมเพย์`
  String get dropdownPaymentChoice1 {
    return Intl.message(
      'QR พร้อมเพย์',
      name: 'dropdownPaymentChoice1',
      desc: '',
      args: [],
    );
  }

  /// `โอนผ่านบัญชีธนาคาร`
  String get dropdownPaymentChoice2 {
    return Intl.message(
      'โอนผ่านบัญชีธนาคาร',
      name: 'dropdownPaymentChoice2',
      desc: '',
      args: [],
    );
  }

  /// `ตัดผ่านบัญชีธนาคาร`
  String get dropdownPaymentChoice3 {
    return Intl.message(
      'ตัดผ่านบัญชีธนาคาร',
      name: 'dropdownPaymentChoice3',
      desc: '',
      args: [],
    );
  }

  /// `Pending for %Your Payment%`
  String get waitingPaymentTitle {
    return Intl.message(
      'Pending for %Your Payment%',
      name: 'waitingPaymentTitle',
      desc: '',
      args: [],
    );
  }

  /// `The Order will be cancelled if you don’t pay with in`
  String get waitingPaymentCancelDesc {
    return Intl.message(
      'The Order will be cancelled if you don’t pay with in',
      name: 'waitingPaymentCancelDesc',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Id`
  String get waitingPaymentTransactionIdLabel {
    return Intl.message(
      'Transaction Id',
      name: 'waitingPaymentTransactionIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `วิธีชำระเงิน`
  String get waitingPaymentHowtoPayLabel {
    return Intl.message(
      'วิธีชำระเงิน',
      name: 'waitingPaymentHowtoPayLabel',
      desc: '',
      args: [],
    );
  }

  /// `สถานะการชำระ`
  String get waitingPaymentStatusLabel {
    return Intl.message(
      'สถานะการชำระ',
      name: 'waitingPaymentStatusLabel',
      desc: '',
      args: [],
    );
  }

  /// `Transaction infomation`
  String get waitingPaymentTransactionSectorLabel {
    return Intl.message(
      'Transaction infomation',
      name: 'waitingPaymentTransactionSectorLabel',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาโอนเงินตามยอดที่ต้องชำระจาก`
  String get waitingPaymentCriticalHint1 {
    return Intl.message(
      'กรุณาโอนเงินตามยอดที่ต้องชำระจาก',
      name: 'waitingPaymentCriticalHint1',
      desc: '',
      args: [],
    );
  }

  /// `บัญชี %bankName% : %bankNumber%`
  String get waitingPaymentCriticalHint2 {
    return Intl.message(
      'บัญชี %bankName% : %bankNumber%',
      name: 'waitingPaymentCriticalHint2',
      desc: '',
      args: [],
    );
  }

  /// `มิเช่นนั้น คำสั่งซื้อของท่านอาจถูกยกเลิก`
  String get waitingPaymentCriticalHint3 {
    return Intl.message(
      'มิเช่นนั้น คำสั่งซื้อของท่านอาจถูกยกเลิก',
      name: 'waitingPaymentCriticalHint3',
      desc: '',
      args: [],
    );
  }

  /// `บันทึกช่วยจำ`
  String get waitingPaymentNoteLabel {
    return Intl.message(
      'บันทึกช่วยจำ',
      name: 'waitingPaymentNoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Payment completed`
  String get paymentCompletedTitle {
    return Intl.message(
      'Payment completed',
      name: 'paymentCompletedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your order is processing, we will notify you when GASTH successfully transferred to your wallet.`
  String get paymentCompletedDesc {
    return Intl.message(
      'Your order is processing, we will notify you when GASTH successfully transferred to your wallet.',
      name: 'paymentCompletedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Id`
  String get paymentCompletedTransactionIdLabel {
    return Intl.message(
      'Transaction Id',
      name: 'paymentCompletedTransactionIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Estimated completion time : %expireDateTime% You will revive an notification once order is completed..`
  String get paymentCompletedHint {
    return Intl.message(
      'Estimated completion time : %expireDateTime% You will revive an notification once order is completed..',
      name: 'paymentCompletedHint',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation %Reason%`
  String get cancelReasonTitle {
    return Intl.message(
      'Cancellation %Reason%',
      name: 'cancelReasonTitle',
      desc: '',
      args: [],
    );
  }

  /// `To avoid loss, don’t cancel an order after you’ve made payment. you temporarily can’t buy crypto if you reach the max. cancelation limit.`
  String get cancelReasonDesc {
    return Intl.message(
      'To avoid loss, don’t cancel an order after you’ve made payment. you temporarily can’t buy crypto if you reach the max. cancelation limit.',
      name: 'cancelReasonDesc',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get cancelReasonChoiceStart {
    return Intl.message(
      '====================================================================',
      name: 'cancelReasonChoiceStart',
      desc: '',
      args: [],
    );
  }

  /// `Select wrong payment method`
  String get cancel_SELECT_WRONG {
    return Intl.message(
      'Select wrong payment method',
      name: 'cancel_SELECT_WRONG',
      desc: '',
      args: [],
    );
  }

  /// `Techical/Network error with payment platform`
  String get cancel_TECHNICAL {
    return Intl.message(
      'Techical/Network error with payment platform',
      name: 'cancel_TECHNICAL',
      desc: '',
      args: [],
    );
  }

  /// `I’ve reached the transfer limit for my bank account / don have sufficient cash`
  String get cancel_TRANSFER_LIMIT {
    return Intl.message(
      'I’ve reached the transfer limit for my bank account / don have sufficient cash',
      name: 'cancel_TRANSFER_LIMIT',
      desc: '',
      args: [],
    );
  }

  /// `Don’t know how to pay`
  String get cancel_HOW_TO_PAY {
    return Intl.message(
      'Don’t know how to pay',
      name: 'cancel_HOW_TO_PAY',
      desc: '',
      args: [],
    );
  }

  /// `Other reason`
  String get cancel_OTHER {
    return Intl.message(
      'Other reason',
      name: 'cancel_OTHER',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get cancelReasonChoiceEnd {
    return Intl.message(
      '====================================================================',
      name: 'cancelReasonChoiceEnd',
      desc: '',
      args: [],
    );
  }

  /// `Order %Cancelled%`
  String get orderCancelTitle {
    return Intl.message(
      'Order %Cancelled%',
      name: 'orderCancelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Order has been cancelled`
  String get orderCancelReasonTitle {
    return Intl.message(
      'Your Order has been cancelled',
      name: 'orderCancelReasonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation reason`
  String get orderCancelReasonLabel {
    return Intl.message(
      'Cancellation reason',
      name: 'orderCancelReasonLabel',
      desc: '',
      args: [],
    );
  }

  /// `แตะเพื่ออัปโหลดหลักฐานการโอนเงิน`
  String get uploadSlip {
    return Intl.message(
      'แตะเพื่ออัปโหลดหลักฐานการโอนเงิน',
      name: 'uploadSlip',
      desc: '',
      args: [],
    );
  }

  /// `*ตัวอย่าง ผลการโอนเงินบนแอปพลิเคชันธนาคาร/ธนาคาร ออนไลน์, สลิป ATM หรือภาพแคปหน้าจอ (Screenshot)`
  String get uploadSlipHint {
    return Intl.message(
      '*ตัวอย่าง ผลการโอนเงินบนแอปพลิเคชันธนาคาร/ธนาคาร ออนไลน์, สลิป ATM หรือภาพแคปหน้าจอ (Screenshot)',
      name: 'uploadSlipHint',
      desc: '',
      args: [],
    );
  }

  /// `ส่งหลักฐานการโอนเงิน`
  String get uploadSlipSubmitButton {
    return Intl.message(
      'ส่งหลักฐานการโอนเงิน',
      name: 'uploadSlipSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `บัญชี %รับเงิน%`
  String get selectBankRecievedTitle {
    return Intl.message(
      'บัญชี %รับเงิน%',
      name: 'selectBankRecievedTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเลือกบัญชีธนาคารที่ได้รับการยืนยันจากเจ้าหน้าที่ แล้วเท่านั้น`
  String get selectBankRecievedDesc {
    return Intl.message(
      'กรุณาเลือกบัญชีธนาคารที่ได้รับการยืนยันจากเจ้าหน้าที่ แล้วเท่านั้น',
      name: 'selectBankRecievedDesc',
      desc: '',
      args: [],
    );
  }

  /// `เลือกบัญชีธนาคาร`
  String get selectBankRecievedSection {
    return Intl.message(
      'เลือกบัญชีธนาคาร',
      name: 'selectBankRecievedSection',
      desc: '',
      args: [],
    );
  }

  /// `Select Bank Account`
  String get selectBankRecievedSelectPlaceholder {
    return Intl.message(
      'Select Bank Account',
      name: 'selectBankRecievedSelectPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get transactionHistoryTitle {
    return Intl.message(
      'History',
      name: 'transactionHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get transactionHistoryListMenu1 {
    return Intl.message(
      'Buy',
      name: 'transactionHistoryListMenu1',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get transactionHistoryListMenu2 {
    return Intl.message(
      'Sell',
      name: 'transactionHistoryListMenu2',
      desc: '',
      args: [],
    );
  }

  /// `Convert`
  String get transactionHistoryListMenu3 {
    return Intl.message(
      'Convert',
      name: 'transactionHistoryListMenu3',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transactionHistoryListMenu4 {
    return Intl.message(
      'Transfer',
      name: 'transactionHistoryListMenu4',
      desc: '',
      args: [],
    );
  }

  /// `Refund`
  String get transactionHistoryListMenu5 {
    return Intl.message(
      'Refund',
      name: 'transactionHistoryListMenu5',
      desc: '',
      args: [],
    );
  }

  /// `ID %Upload%`
  String get kycIntrodunctionHeadline {
    return Intl.message(
      'ID %Upload%',
      name: 'kycIntrodunctionHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Please Make Sure Your National ID Card Has...`
  String get kycIntrodunctionTitle {
    return Intl.message(
      'Please Make Sure Your National ID Card Has...',
      name: 'kycIntrodunctionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Clearly visible detail and the expiration date not approaching within the next 60 days.`
  String get kycIntrodunctionDescription1 {
    return Intl.message(
      'Clearly visible detail and the expiration date not approaching within the next 60 days.',
      name: 'kycIntrodunctionDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Take photo of %Both sides of the card%. make sure the photos are visible in the frame.`
  String get kycIntrodunctionDescription2 {
    return Intl.message(
      'Take photo of %Both sides of the card%. make sure the photos are visible in the frame.',
      name: 'kycIntrodunctionDescription2',
      desc: '',
      args: [],
    );
  }

  /// `The Photos must be clear and well-lit.`
  String get kycIntrodunctionDescription3 {
    return Intl.message(
      'The Photos must be clear and well-lit.',
      name: 'kycIntrodunctionDescription3',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %ประเภทการเปิดบัญชี%`
  String get kycSelectCustomerTypeHeadline {
    return Intl.message(
      'เลือก %ประเภทการเปิดบัญชี%',
      name: 'kycSelectCustomerTypeHeadline',
      desc: '',
      args: [],
    );
  }

  /// `บุคคลธรรมดา`
  String get kycSelectCustomerTypeOption1 {
    return Intl.message(
      'บุคคลธรรมดา',
      name: 'kycSelectCustomerTypeOption1',
      desc: '',
      args: [],
    );
  }

  /// `นิติบุคคล\n%(เร็วๆนี้)%`
  String get kycSelectCustomerTypeOption2 {
    return Intl.message(
      'นิติบุคคล\n%(เร็วๆนี้)%',
      name: 'kycSelectCustomerTypeOption2',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %สัญชาติ%`
  String get kycSelectNationalHeadline {
    return Intl.message(
      'เลือก %สัญชาติ%',
      name: 'kycSelectNationalHeadline',
      desc: '',
      args: [],
    );
  }

  /// `สัญชาติไทย`
  String get kycSelectNationalOption1 {
    return Intl.message(
      'สัญชาติไทย',
      name: 'kycSelectNationalOption1',
      desc: '',
      args: [],
    );
  }

  /// `สัญชาติอื่น\n%(เร็วๆนี้)%`
  String get kycSelectNationalOption2 {
    return Intl.message(
      'สัญชาติอื่น\n%(เร็วๆนี้)%',
      name: 'kycSelectNationalOption2',
      desc: '',
      args: [],
    );
  }

  /// `%ถ่ายถาพใบหน้า%`
  String get kycSelfieIntroHeadline {
    return Intl.message(
      '%ถ่ายถาพใบหน้า%',
      name: 'kycSelfieIntroHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายภาพตนเองหน้าตรง ให้ใบหน้าอยู่กึ่งกลางภาพ เห็นใบหน้าชัดเจน และสายตามองตรงที่กล้อง`
  String get kycSelfieIntroContent {
    return Intl.message(
      'ถ่ายภาพตนเองหน้าตรง ให้ใบหน้าอยู่กึ่งกลางภาพ เห็นใบหน้าชัดเจน และสายตามองตรงที่กล้อง',
      name: 'kycSelfieIntroContent',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนผู้ใช้งาน\n%ไม่ผ่านการอนุมัติ%`
  String get kycFatcaFailedHeadline {
    return Intl.message(
      'การยืนยันตัวตนผู้ใช้งาน\n%ไม่ผ่านการอนุมัติ%',
      name: 'kycFatcaFailedHeadline',
      desc: '',
      args: [],
    );
  }

  /// `เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ\nจึงไม่สามารถให้บริการท่านได้`
  String get kycFatcaFailedContent {
    return Intl.message(
      'เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ\nจึงไม่สามารถให้บริการท่านได้',
      name: 'kycFatcaFailedContent',
      desc: '',
      args: [],
    );
  }

  /// `ข้าพเจ้ายอมรับข้อกำหนดและเงื่อนไข`
  String get kycTermSubHeadline {
    return Intl.message(
      'ข้าพเจ้ายอมรับข้อกำหนดและเงื่อนไข',
      name: 'kycTermSubHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ข้อกำหนดและเงื่อนไขการเปิดและใช้บริการ 1109x (Mobile Application)`
  String get kycTermAcceptAconnecTitle {
    return Intl.message(
      'ข้อกำหนดและเงื่อนไขการเปิดและใช้บริการ 1109x (Mobile Application)',
      name: 'kycTermAcceptAconnecTitle',
      desc: '',
      args: [],
    );
  }

  /// `ผู้ขอใช้บริการตกลงใช้บริการ 1109x ตามรายละเอียดการให้บริการที่บริษัทฯ กำหนด โดยตกลงผูกพัน`
  String get kycTermAcceptAconnecSubTitle {
    return Intl.message(
      'ผู้ขอใช้บริการตกลงใช้บริการ 1109x ตามรายละเอียดการให้บริการที่บริษัทฯ กำหนด โดยตกลงผูกพัน',
      name: 'kycTermAcceptAconnecSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `ความเสี่ยงของการซื้อขายสินทรัพย์ดิจิทัล`
  String get kycTermAcceptRiskTitle {
    return Intl.message(
      'ความเสี่ยงของการซื้อขายสินทรัพย์ดิจิทัล',
      name: 'kycTermAcceptRiskTitle',
      desc: '',
      args: [],
    );
  }

  /// `การซื้อขายสินทรัพย์ดิจิทัลเป็นการซื้อขายสินทรัพย์ในรูปแบบใหม่ที่มีเงื่อนไขและรูปแบบที่หลากหลายเป็นอย่างมากลูกค้าจึงควรศึกษาและทำความเข้าใจก่อนการซื้อขายทุกครั้ง`
  String get kycTermAcceptRiskSubTitle {
    return Intl.message(
      'การซื้อขายสินทรัพย์ดิจิทัลเป็นการซื้อขายสินทรัพย์ในรูปแบบใหม่ที่มีเงื่อนไขและรูปแบบที่หลากหลายเป็นอย่างมากลูกค้าจึงควรศึกษาและทำความเข้าใจก่อนการซื้อขายทุกครั้ง',
      name: 'kycTermAcceptRiskSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `เพื่อการเก็บรวบรวม ใช้ เปิดเผย ข้อมูล Biometric`
  String get kycTermAcceptCollectDataTitle {
    return Intl.message(
      'เพื่อการเก็บรวบรวม ใช้ เปิดเผย ข้อมูล Biometric',
      name: 'kycTermAcceptCollectDataTitle',
      desc: '',
      args: [],
    );
  }

  /// `ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลทางชีวภาพของท่าน เพื่อวัตถุประสงค์ในการยืนยันและระบุตัวตนของท่าน`
  String get kycTermAcceptCollectDataSubTitle {
    return Intl.message(
      'ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลทางชีวภาพของท่าน เพื่อวัตถุประสงค์ในการยืนยันและระบุตัวตนของท่าน',
      name: 'kycTermAcceptCollectDataSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `1. เพื่อการตลาด (Marketing)`
  String get kycTermAcceptMarketingTitle {
    return Intl.message(
      '1. เพื่อการตลาด (Marketing)',
      name: 'kycTermAcceptMarketingTitle',
      desc: '',
      args: [],
    );
  }

  /// `ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลส่วนบุคคลของท่าน เพื่อวัตถุประสงค์ทางการตลาดของบริษัทฯ`
  String get kycTermAcceptMarketingSubTitle {
    return Intl.message(
      'ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลส่วนบุคคลของท่าน เพื่อวัตถุประสงค์ทางการตลาดของบริษัทฯ',
      name: 'kycTermAcceptMarketingSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `2. เพื่อเปิดเผยข้อมูลให้แก่กลุ่มธุรกิจการเงิน`
  String get kycTermAcceptFinancialTitle {
    return Intl.message(
      '2. เพื่อเปิดเผยข้อมูลให้แก่กลุ่มธุรกิจการเงิน',
      name: 'kycTermAcceptFinancialTitle',
      desc: '',
      args: [],
    );
  }

  /// `ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลส่วนบุคคลของท่านให้กับกลุ่มธุรกิจทางการเงินของบริษัทฯ`
  String get kycTermAcceptFinancialSubTitle {
    return Intl.message(
      'ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลส่วนบุคคลของท่านให้กับกลุ่มธุรกิจทางการเงินของบริษัทฯ',
      name: 'kycTermAcceptFinancialSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `3. เพื่อการพัฒนาผลิตภัณฑ์ (Product Development)`
  String get kycTermAcceptDevelopmentTitle {
    return Intl.message(
      '3. เพื่อการพัฒนาผลิตภัณฑ์ (Product Development)',
      name: 'kycTermAcceptDevelopmentTitle',
      desc: '',
      args: [],
    );
  }

  /// `ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่าน เพื่อวัตถุประสงค์ในการพัฒนาผลิตภัณฑ์ของบริษัทฯ`
  String get kycTermAcceptDevelopmentSubTitle {
    return Intl.message(
      'ความยินยอมเพื่อเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลของท่าน เพื่อวัตถุประสงค์ในการพัฒนาผลิตภัณฑ์ของบริษัทฯ',
      name: 'kycTermAcceptDevelopmentSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `ความยินยอมในการเก็บรวบรวม ใช้ และ/หรือเปิดเผย ข้อมูลส่วนบุคคล`
  String get kycTermPersonalDataAcceptHeadline {
    return Intl.message(
      'ความยินยอมในการเก็บรวบรวม ใช้ และ/หรือเปิดเผย ข้อมูลส่วนบุคคล',
      name: 'kycTermPersonalDataAcceptHeadline',
      desc: '',
      args: [],
    );
  }

  /// `บริษัท 1109 พรอส์เปอร์ จำกัด ("บริษัท") มีความมุ่งมั่นที่จะมอบผลิตภัณฑ์ และ/หรือ บริการที่ตรงตามความต้องการของท่าน บริษัทฯ จึงขอความยินยอมจากท่านในการเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลส่วนบุคคลของท่านตามพระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล พ.ศ. 2562 โดยท่านมีสิทธิที่จะเลือกให้หรือไม่ให้ความยินยอมฯ เพื่อวัตถุประสงค์ตามที่ระบุไว้ด้านล่างนี้เมื่อใดก็ได้ ทั้งนี้การไม่ให้ความยินยอมดังกล่าวจะไม่กระทบต่อการใช้ผลิตภัณฑ์ และ/หรือ บริการของบริษัทฯ`
  String get kycTermAconnecDescription {
    return Intl.message(
      'บริษัท 1109 พรอส์เปอร์ จำกัด ("บริษัท") มีความมุ่งมั่นที่จะมอบผลิตภัณฑ์ และ/หรือ บริการที่ตรงตามความต้องการของท่าน บริษัทฯ จึงขอความยินยอมจากท่านในการเก็บรวบรวม ใช้ และ/หรือ เปิดเผยข้อมูลส่วนบุคคลของท่านตามพระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล พ.ศ. 2562 โดยท่านมีสิทธิที่จะเลือกให้หรือไม่ให้ความยินยอมฯ เพื่อวัตถุประสงค์ตามที่ระบุไว้ด้านล่างนี้เมื่อใดก็ได้ ทั้งนี้การไม่ให้ความยินยอมดังกล่าวจะไม่กระทบต่อการใช้ผลิตภัณฑ์ และ/หรือ บริการของบริษัทฯ',
      name: 'kycTermAconnecDescription',
      desc: '',
      args: [],
    );
  }

  /// `ข้าพเจ้าได้อ่านและรับทราบหนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคลของบริษัทฯ แล้ว และข้าพเจ้ารับทราบว่า ข้าพเจ้ามีสิทธิถอนความยินยอมในการเก็บรวบรวม ใช้ และ/หรือเปิดเผย ข้อมูลส่วนบุคคลของข้าพเจ้าเพื่อวัตถุประสงค์ตามที่ระบุไว้ในหนังสือฉบับนี้ได้ตลอดเวลา โดยแจ้งให้กับบริษัทฯ ทราบเป็นลายลักษณ์อักษรถึงการถอนความยินยอมเช่นว่านั้นแก่บริษัทฯ`
  String get kycTermFooterDescription {
    return Intl.message(
      'ข้าพเจ้าได้อ่านและรับทราบหนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคลของบริษัทฯ แล้ว และข้าพเจ้ารับทราบว่า ข้าพเจ้ามีสิทธิถอนความยินยอมในการเก็บรวบรวม ใช้ และ/หรือเปิดเผย ข้อมูลส่วนบุคคลของข้าพเจ้าเพื่อวัตถุประสงค์ตามที่ระบุไว้ในหนังสือฉบับนี้ได้ตลอดเวลา โดยแจ้งให้กับบริษัทฯ ทราบเป็นลายลักษณ์อักษรถึงการถอนความยินยอมเช่นว่านั้นแก่บริษัทฯ',
      name: 'kycTermFooterDescription',
      desc: '',
      args: [],
    );
  }

  /// `ตลอดชีพ`
  String get kycInformationIdCardLifetime {
    return Intl.message(
      'ตลอดชีพ',
      name: 'kycInformationIdCardLifetime',
      desc: '',
      args: [],
    );
  }

  /// `เลือกประเทศของแหล่งเงินทุน`
  String get kycSuiteTestSelectSourceOfFundCountryPlaceholder {
    return Intl.message(
      'เลือกประเทศของแหล่งเงินทุน',
      name: 'kycSuiteTestSelectSourceOfFundCountryPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `ประเมิน %ความเหมาะสมในการลงทุน%`
  String get kycPreSuiteableTestHeadline {
    return Intl.message(
      'ประเมิน %ความเหมาะสมในการลงทุน%',
      name: 'kycPreSuiteableTestHeadline',
      desc: '',
      args: [],
    );
  }

  /// `โปรดทำแบบประเมินความเหมาะสมในการลงทุน`
  String get kycPreSuiteableTestSubTitle {
    return Intl.message(
      'โปรดทำแบบประเมินความเหมาะสมในการลงทุน',
      name: 'kycPreSuiteableTestSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `สถานภาพ/ตำแหน่ง ทางการเมือง`
  String get kycPersonalFundIsPoliticPersionLabel {
    return Intl.message(
      'สถานภาพ/ตำแหน่ง ทางการเมือง',
      name: 'kycPersonalFundIsPoliticPersionLabel',
      desc: '',
      args: [],
    );
  }

  /// `ที่อยู่ปัจจุบัน`
  String get kycAddressSwitchOption3 {
    return Intl.message(
      'ที่อยู่ปัจจุบัน',
      name: 'kycAddressSwitchOption3',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันรหัส PIN`
  String get confirmSetPinTitle {
    return Intl.message(
      'ยืนยันรหัส PIN',
      name: 'confirmSetPinTitle',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน\n%ผู้ใช้งาน%`
  String get underReviewHeadline {
    return Intl.message(
      'ยืนยันตัวตน\n%ผู้ใช้งาน%',
      name: 'underReviewHeadline',
      desc: '',
      args: [],
    );
  }

  /// `อยู่ระหว่างการตรวจสอบ`
  String get underReviewTitle {
    return Intl.message(
      'อยู่ระหว่างการตรวจสอบ',
      name: 'underReviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `การดําเนินการจะใช้เวลาภายใน 5 วันทําการ โดยท่านจะได้รับการแจ้งผลผ่านทางอีเมล\n\nอาจมีการติดต่อท่าน จากเจ้าหน้าที่ด้วยเบอร์ 0661101109`
  String get underReviewContent {
    return Intl.message(
      'การดําเนินการจะใช้เวลาภายใน 5 วันทําการ โดยท่านจะได้รับการแจ้งผลผ่านทางอีเมล\n\nอาจมีการติดต่อท่าน จากเจ้าหน้าที่ด้วยเบอร์ 0661101109',
      name: 'underReviewContent',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตนผู้ใช้งาน %ไม่ผ่านการอนุมัติ%`
  String get kycNotApproveTitle {
    return Intl.message(
      'การยืนยันตัวตนผู้ใช้งาน %ไม่ผ่านการอนุมัติ%',
      name: 'kycNotApproveTitle',
      desc: '',
      args: [],
    );
  }

  /// `เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ จึงไม่สามารถให้บริการท่านได้`
  String get kycNotApproveContent {
    return Intl.message(
      'เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ จึงไม่สามารถให้บริการท่านได้',
      name: 'kycNotApproveContent',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตนผู้ใช้งาน`
  String get kycNavTitle {
    return Intl.message(
      'ยืนยันตัวตนผู้ใช้งาน',
      name: 'kycNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ไม่สามารถทำการยืนยันตัวตนได้โปรดติดต่อเจ้าหน้าที่`
  String get ndidReachToLimit {
    return Intl.message(
      'ไม่สามารถทำการยืนยันตัวตนได้โปรดติดต่อเจ้าหน้าที่',
      name: 'ndidReachToLimit',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน\n%ไม่สำเร็จ%`
  String get kycNotSuccessHeadline {
    return Intl.message(
      'ยืนยันตัวตน\n%ไม่สำเร็จ%',
      name: 'kycNotSuccessHeadline',
      desc: '',
      args: [],
    );
  }

  /// `สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net`
  String get contactCompany {
    return Intl.message(
      'สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net',
      name: 'contactCompany',
      desc: '',
      args: [],
    );
  }

  /// `ขั้นตอนในการยืนยันตัวตน`
  String get ndidIntroductionCounterServiceHeadline {
    return Intl.message(
      'ขั้นตอนในการยืนยันตัวตน',
      name: 'ndidIntroductionCounterServiceHeadline',
      desc: '',
      args: [],
    );
  }

  /// `นัดวันและเวลา เพื่อดำเนินการ Dip Chip กับเจ้าหน้าที่ของเราที่เบอร์ 0661101109\n\nให้บริการวันจันทร์ - วันศุกร์\nช่วงเช้า (09.00 - 12.00 น.)\nช่วงบ่าย (13.00 - 18.00 น.)\nหยุดวันเสาร์ วันอาทิตย์ และวันหยุดนักขัตฤกษ์`
  String get ndidIntroductionCounterServiceList1 {
    return Intl.message(
      'นัดวันและเวลา เพื่อดำเนินการ Dip Chip กับเจ้าหน้าที่ของเราที่เบอร์ 0661101109\n\nให้บริการวันจันทร์ - วันศุกร์\nช่วงเช้า (09.00 - 12.00 น.)\nช่วงบ่าย (13.00 - 18.00 น.)\nหยุดวันเสาร์ วันอาทิตย์ และวันหยุดนักขัตฤกษ์',
      name: 'ndidIntroductionCounterServiceList1',
      desc: '',
      args: [],
    );
  }

  /// `เตรียมบัตรประชาชนตัวจริงที่ยังไม่หมดอายุ และผู้ดำเนินการยืนยันตัวตนต้องเป็นเจ้าของบัตรประชาชนเท่านั้น`
  String get ndidIntroductionCounterServiceList2 {
    return Intl.message(
      'เตรียมบัตรประชาชนตัวจริงที่ยังไม่หมดอายุ และผู้ดำเนินการยืนยันตัวตนต้องเป็นเจ้าของบัตรประชาชนเท่านั้น',
      name: 'ndidIntroductionCounterServiceList2',
      desc: '',
      args: [],
    );
  }

  /// `ติดต่อขอยืนยันตัวตนตามวันและเวลานัดหมายที่\n\nบริษัท 1109 พรอส์เปอร์ จำกัด\nมิตรทาวน์ ออฟฟิศ ทาวเวอร์, ชั้นที่ 26, ห้องเลขที่ S26089, 944 ถนนพระราม 4 แขวงวังใหม่ เขตปทุมวัน กรุงเทพฯ 10330`
  String get ndidIntroductionCounterServiceList3 {
    return Intl.message(
      'ติดต่อขอยืนยันตัวตนตามวันและเวลานัดหมายที่\n\nบริษัท 1109 พรอส์เปอร์ จำกัด\nมิตรทาวน์ ออฟฟิศ ทาวเวอร์, ชั้นที่ 26, ห้องเลขที่ S26089, 944 ถนนพระราม 4 แขวงวังใหม่ เขตปทุมวัน กรุงเทพฯ 10330',
      name: 'ndidIntroductionCounterServiceList3',
      desc: '',
      args: [],
    );
  }

  /// `กดปุ่ม "เริ่มยืนยันตัวตน" ด้านล่าง เมื่อพร้อม รับบริการ`
  String get ndidIntroductionCounterServiceList4 {
    return Intl.message(
      'กดปุ่ม "เริ่มยืนยันตัวตน" ด้านล่าง เมื่อพร้อม รับบริการ',
      name: 'ndidIntroductionCounterServiceList4',
      desc: '',
      args: [],
    );
  }

  /// `หากยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด ระบบจะยกเลิกการยืนยันตัวตน ท่านสามารถ กด "เริ่มยืนยันตัวตน" อีกครั้ง เมื่อพร้อมยืน ยันตัวตน`
  String get ndidIntroductionCounterServiceList5 {
    return Intl.message(
      'หากยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด ระบบจะยกเลิกการยืนยันตัวตน ท่านสามารถ กด "เริ่มยืนยันตัวตน" อีกครั้ง เมื่อพร้อมยืน ยันตัวตน',
      name: 'ndidIntroductionCounterServiceList5',
      desc: '',
      args: [],
    );
  }

  /// `คลิกดูแผนที่`
  String get ndidIntroductionCounterServiceMap {
    return Intl.message(
      'คลิกดูแผนที่',
      name: 'ndidIntroductionCounterServiceMap',
      desc: '',
      args: [],
    );
  }

  /// `ท่านกำลังยืนยันตัวตนเพื่อใช้ตาม วัตถุประสงค์ของ %บริษัท 1109 พรอส์เปอร์ จำกัด%`
  String get ndidAconnecWaitingHeadline {
    return Intl.message(
      'ท่านกำลังยืนยันตัวตนเพื่อใช้ตาม วัตถุประสงค์ของ %บริษัท 1109 พรอส์เปอร์ จำกัด%',
      name: 'ndidAconnecWaitingHeadline',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาติดต่อเจ้าหน้าที่พร้อมแสดงบัตรประชาชน เพื่อเริ่มยืนยันตัวตน`
  String get ndidAconnecWaitingContent {
    return Intl.message(
      'กรุณาติดต่อเจ้าหน้าที่พร้อมแสดงบัตรประชาชน เพื่อเริ่มยืนยันตัวตน',
      name: 'ndidAconnecWaitingContent',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Ref: @value`
  String get ndidAconnectWaitingRef {
    return Intl.message(
      'Transaction Ref: @value',
      name: 'ndidAconnectWaitingRef',
      desc: '',
      args: [],
    );
  }

  /// `หากท่านไม่สะดวกยืนยันตัวตนทันที สามารถกลับมาเปิดหน้านี้ ใหม่ ซึ่ง QR Code จะยังแสดงอยู่`
  String get ndidAconnectWaitingWarning1 {
    return Intl.message(
      'หากท่านไม่สะดวกยืนยันตัวตนทันที สามารถกลับมาเปิดหน้านี้ ใหม่ ซึ่ง QR Code จะยังแสดงอยู่',
      name: 'ndidAconnectWaitingWarning1',
      desc: '',
      args: [],
    );
  }

  /// `หากต้องการยกเลิกการยืนยันตัวตนหรือเปลี่ยนช่องทางการยืนยันตัวตน กรุณาคลิก "ยกเลิกการยืนยันตัวตน"`
  String get ndidAconnectWaitingWarning2 {
    return Intl.message(
      'หากต้องการยกเลิกการยืนยันตัวตนหรือเปลี่ยนช่องทางการยืนยันตัวตน กรุณาคลิก "ยกเลิกการยืนยันตัวตน"',
      name: 'ndidAconnectWaitingWarning2',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตนภายใน\n@value`
  String get ndidAconnectWaitingQrWarning {
    return Intl.message(
      'ยืนยันตัวตนภายใน\n@value',
      name: 'ndidAconnectWaitingQrWarning',
      desc: '',
      args: [],
    );
  }

  /// `สามารถใช้ได้ถึงวันที่ @value`
  String get ndidAconnectWaitingQrExpiredDate {
    return Intl.message(
      'สามารถใช้ได้ถึงวันที่ @value',
      name: 'ndidAconnectWaitingQrExpiredDate',
      desc: '',
      args: [],
    );
  }

  /// `บุคคลที่มีสถานภาพทางการเมือง%PEPs%`
  String get ndidPoliticStateHeadline {
    return Intl.message(
      'บุคคลที่มีสถานภาพทางการเมือง%PEPs%',
      name: 'ndidPoliticStateHeadline',
      desc: '',
      args: [],
    );
  }

  /// `ข้าพเจ้ายืนยันว่าคำรับรองที่ให้ไว้กับทางบริษัทฯ เป็นความจริง ทุกประการ และเข้าใจว่าเมื่อข้อมูลข้างต้น เปลี่ยนแปลง ข้าพเจ้า จะแจ้งบริษัทฯ ในทันที`
  String get ndidPoliticStateFooter {
    return Intl.message(
      'ข้าพเจ้ายืนยันว่าคำรับรองที่ให้ไว้กับทางบริษัทฯ เป็นความจริง ทุกประการ และเข้าใจว่าเมื่อข้อมูลข้างต้น เปลี่ยนแปลง ข้าพเจ้า จะแจ้งบริษัทฯ ในทันที',
      name: 'ndidPoliticStateFooter',
      desc: '',
      args: [],
    );
  }

  /// `ความเสี่ยงต่ำ`
  String get riskLow {
    return Intl.message(
      'ความเสี่ยงต่ำ',
      name: 'riskLow',
      desc: '',
      args: [],
    );
  }

  /// `ความเสี่ยงต่ำ - ปานกลาง`
  String get riskBetweenLowMedium {
    return Intl.message(
      'ความเสี่ยงต่ำ - ปานกลาง',
      name: 'riskBetweenLowMedium',
      desc: '',
      args: [],
    );
  }

  /// `ความเสี่ยงปานกลาง - สูง`
  String get riskBetweenMediumHigh {
    return Intl.message(
      'ความเสี่ยงปานกลาง - สูง',
      name: 'riskBetweenMediumHigh',
      desc: '',
      args: [],
    );
  }

  /// `ความเสี่ยงสูง`
  String get riskHigh {
    return Intl.message(
      'ความเสี่ยงสูง',
      name: 'riskHigh',
      desc: '',
      args: [],
    );
  }

  /// `ความเสี่ยงสูงมาก`
  String get riskVeryHigh {
    return Intl.message(
      'ความเสี่ยงสูงมาก',
      name: 'riskVeryHigh',
      desc: '',
      args: [],
    );
  }

  /// `ความยินยอมในการเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลที่มีความอ่อนไหว %เพื่อการพิสูจน์และยืนยันตัวตน%`
  String get kycPdpaHeadline {
    return Intl.message(
      'ความยินยอมในการเก็บรวบรวม ใช้ และ/หรือเปิดเผยข้อมูลส่วนบุคคลที่มีความอ่อนไหว %เพื่อการพิสูจน์และยืนยันตัวตน%',
      name: 'kycPdpaHeadline',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตน`
  String get kycWarningTitle {
    return Intl.message(
      'การยืนยันตัวตน',
      name: 'kycWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// ` เนื่องจาก บริษัท 1109 พรอส์เปอร์ จำกัด ดำเนินการภายใต้การกำกับดูแลของ %สำนักงานคณะกรรมการกำกับหลักทรัพย์และตลาดหลักทรัพย์ (ก.ล.ต.)% เราจึงมีความจำเป็นต้องขอข้อมูล ยืนยันตัวตนของท่าน`
  String get kycWarningContent {
    return Intl.message(
      ' เนื่องจาก บริษัท 1109 พรอส์เปอร์ จำกัด ดำเนินการภายใต้การกำกับดูแลของ %สำนักงานคณะกรรมการกำกับหลักทรัพย์และตลาดหลักทรัพย์ (ก.ล.ต.)% เราจึงมีความจำเป็นต้องขอข้อมูล ยืนยันตัวตนของท่าน',
      name: 'kycWarningContent',
      desc: '',
      args: [],
    );
  }

  /// `Purchase`
  String get confirmOrderPurchaseLabel {
    return Intl.message(
      'Purchase',
      name: 'confirmOrderPurchaseLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total Pay`
  String get confirmOrderTotalPayLabel {
    return Intl.message(
      'Total Pay',
      name: 'confirmOrderTotalPayLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total Receive`
  String get confirmOrderTotalRecieveLabel {
    return Intl.message(
      'Total Receive',
      name: 'confirmOrderTotalRecieveLabel',
      desc: '',
      args: [],
    );
  }

  /// `จำนวนเหรียญสุทธิที่จะได้รับ อาจมีการเปลี่ยนแปลงขึ้นอยู่ กับการคำนวณราคาแลกเปลี่ยน ณ เวลาที่บริษัทฯ ได้รับชำระแล้ว`
  String get coinAmountWarningText {
    return Intl.message(
      'จำนวนเหรียญสุทธิที่จะได้รับ อาจมีการเปลี่ยนแปลงขึ้นอยู่ กับการคำนวณราคาแลกเปลี่ยน ณ เวลาที่บริษัทฯ ได้รับชำระแล้ว',
      name: 'coinAmountWarningText',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get walletAddressLabel {
    return Intl.message(
      'Address',
      name: 'walletAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `Input Address`
  String get walletAddressPlaceholder {
    return Intl.message(
      'Input Address',
      name: 'walletAddressPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get walletNetworkLabel {
    return Intl.message(
      'Network',
      name: 'walletNetworkLabel',
      desc: '',
      args: [],
    );
  }

  /// `Coupon`
  String get couponLabel {
    return Intl.message(
      'Coupon',
      name: 'couponLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Network`
  String get walletNetWorkPlaceholder {
    return Intl.message(
      'Select Network',
      name: 'walletNetWorkPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Select Coupon`
  String get couponPlaceholder {
    return Intl.message(
      'Select Coupon',
      name: 'couponPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Select %Network%`
  String get selectNetworkTitle {
    return Intl.message(
      'Select %Network%',
      name: 'selectNetworkTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาตรวจสอบ Network ที่เลือกเสมอ เพื่อป้องกันธุรกรรมสูญหาย`
  String get selectNetworkWarningText {
    return Intl.message(
      'กรุณาตรวจสอบ Network ที่เลือกเสมอ เพื่อป้องกันธุรกรรมสูญหาย',
      name: 'selectNetworkWarningText',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get confirmOrderReceiveLabel {
    return Intl.message(
      'Receive',
      name: 'confirmOrderReceiveLabel',
      desc: '',
      args: [],
    );
  }

  /// `อาชีพปัจจุบัน`
  String get fundInformationOccupationGroupLabel {
    return Intl.message(
      'อาชีพปัจจุบัน',
      name: 'fundInformationOccupationGroupLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือกอาชีพ`
  String get fundInformationOccupationGroupPlaceholder {
    return Intl.message(
      'เลือกอาชีพ',
      name: 'fundInformationOccupationGroupPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `สาขาอาชีพ`
  String get fundInformationOccupationLabel {
    return Intl.message(
      'สาขาอาชีพ',
      name: 'fundInformationOccupationLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือกสาขาอาชีพ`
  String get fundInformationOccupationPlaceholder {
    return Intl.message(
      'เลือกสาขาอาชีพ',
      name: 'fundInformationOccupationPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get waitingReceiveCoinNetworkLabel {
    return Intl.message(
      'Network',
      name: 'waitingReceiveCoinNetworkLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Network`
  String get waitingReceiveCoinNetworkPlacholder {
    return Intl.message(
      'Select Network',
      name: 'waitingReceiveCoinNetworkPlacholder',
      desc: '',
      args: [],
    );
  }

  /// `Total Pay`
  String get waitingReceiveCoinTotalPayLabel {
    return Intl.message(
      'Total Pay',
      name: 'waitingReceiveCoinTotalPayLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create Address`
  String get waitingReceiveCoinAddAddressLabel {
    return Intl.message(
      'Create Address',
      name: 'waitingReceiveCoinAddAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาโอนเหรียญตามจำนวนที่ยืนยันขาย`
  String get waitingReceiveCoinWarningTitle {
    return Intl.message(
      'กรุณาโอนเหรียญตามจำนวนที่ยืนยันขาย',
      name: 'waitingReceiveCoinWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// `ต้องโอนเหรียญที่ได้มาจากการซื้อ ขาย แลกเปลี่ยน หรือที่ได้ฝากไว้กับผู้ประกอบธุรกิจสินทรัพย์ดิจิทัลที่ได้รับอนุญาตตามมาตรา 9 แห่งพระราชกำหนด การประกอบธุรกิจสินทรัพย์ดิจิทัลมิเช่นนั้นคำสั่งซื้อของท่านอาจถูกยกเลิก`
  String get waitingReceiveCoinWarningContent {
    return Intl.message(
      'ต้องโอนเหรียญที่ได้มาจากการซื้อ ขาย แลกเปลี่ยน หรือที่ได้ฝากไว้กับผู้ประกอบธุรกิจสินทรัพย์ดิจิทัลที่ได้รับอนุญาตตามมาตรา 9 แห่งพระราชกำหนด การประกอบธุรกิจสินทรัพย์ดิจิทัลมิเช่นนั้นคำสั่งซื้อของท่านอาจถูกยกเลิก',
      name: 'waitingReceiveCoinWarningContent',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Id`
  String get waitingReceiveCoinTransactionIdLabel {
    return Intl.message(
      'Transaction Id',
      name: 'waitingReceiveCoinTransactionIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `บัญชีรับเงิน`
  String get waitingReceiveCoinBankDetailSection {
    return Intl.message(
      'บัญชีรับเงิน',
      name: 'waitingReceiveCoinBankDetailSection',
      desc: '',
      args: [],
    );
  }

  /// `ธนาคาร`
  String get waitingReceiveCoinBankNameLabel {
    return Intl.message(
      'ธนาคาร',
      name: 'waitingReceiveCoinBankNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อบัญชี`
  String get waitingReceiveCoinBankOwnerNameLabel {
    return Intl.message(
      'ชื่อบัญชี',
      name: 'waitingReceiveCoinBankOwnerNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลขบัญชี`
  String get waitingReceiveCoinBankNumberLabel {
    return Intl.message(
      'เลขบัญชี',
      name: 'waitingReceiveCoinBankNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `สถานะ`
  String get waitingReceiveCoinStatus {
    return Intl.message(
      'สถานะ',
      name: 'waitingReceiveCoinStatus',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get waitingReceiveCoinAmountLabel {
    return Intl.message(
      'Amount',
      name: 'waitingReceiveCoinAmountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Share detail`
  String get waitingReceiveCoinShareDetailLabel {
    return Intl.message(
      'Share detail',
      name: 'waitingReceiveCoinShareDetailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Deposit address`
  String get waitingReceiveCoinDepositAddressLabel {
    return Intl.message(
      'Deposit address',
      name: 'waitingReceiveCoinDepositAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `โปรดระบุสาขาอาชีพ`
  String get fundInformationOccupationOtherPlaceholder {
    return Intl.message(
      'โปรดระบุสาขาอาชีพ',
      name: 'fundInformationOccupationOtherPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `อาชีพอื่นที่ทำรายได้สูงสุด`
  String get fundInformationAnotherOccupationGroupLabel {
    return Intl.message(
      'อาชีพอื่นที่ทำรายได้สูงสุด',
      name: 'fundInformationAnotherOccupationGroupLabel',
      desc: '',
      args: [],
    );
  }

  /// `สาขาอาชีพอื่นที่ทำรายได้สูงสุด`
  String get fundInformationAnotherOccupationLabel {
    return Intl.message(
      'สาขาอาชีพอื่นที่ทำรายได้สูงสุด',
      name: 'fundInformationAnotherOccupationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Order To %Receive%`
  String get transactionOrderToReceiveNavTitle {
    return Intl.message(
      'Order To %Receive%',
      name: 'transactionOrderToReceiveNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your order is processing`
  String get transactionOrderToReceiveWarningTitle {
    return Intl.message(
      'Your order is processing',
      name: 'transactionOrderToReceiveWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// `We will notify you when digital asset successfully transferred to your wallet.`
  String get transactionOrderToReceiveWarningContent {
    return Intl.message(
      'We will notify you when digital asset successfully transferred to your wallet.',
      name: 'transactionOrderToReceiveWarningContent',
      desc: '',
      args: [],
    );
  }

  /// `We will notify you when fund successfully transferred to your bank account.`
  String get transactionOrderToReceiveSellWarningContent {
    return Intl.message(
      'We will notify you when fund successfully transferred to your bank account.',
      name: 'transactionOrderToReceiveSellWarningContent',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get transactionHistoryBuySellFilterStatus1 {
    return Intl.message(
      'All',
      name: 'transactionHistoryBuySellFilterStatus1',
      desc: '',
      args: [],
    );
  }

  /// `To Pay`
  String get transactionHistoryBuySellFilterStatus2 {
    return Intl.message(
      'To Pay',
      name: 'transactionHistoryBuySellFilterStatus2',
      desc: '',
      args: [],
    );
  }

  /// `To Receive`
  String get transactionHistoryBuySellFilterStatus3 {
    return Intl.message(
      'To Receive',
      name: 'transactionHistoryBuySellFilterStatus3',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get transactionHistoryBuySellFilterStatus4 {
    return Intl.message(
      'Completed',
      name: 'transactionHistoryBuySellFilterStatus4',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get transactionDownloadNavTitle {
    return Intl.message(
      'Download',
      name: 'transactionDownloadNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `Document Download`
  String get transactionDownloadLabel1 {
    return Intl.message(
      'Document Download',
      name: 'transactionDownloadLabel1',
      desc: '',
      args: [],
    );
  }

  /// `Statement`
  String get transactionDownloadStatementLabel {
    return Intl.message(
      'Statement',
      name: 'transactionDownloadStatementLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tax invoice`
  String get transactionDownloadTaxInvoiceLabel {
    return Intl.message(
      'Tax invoice',
      name: 'transactionDownloadTaxInvoiceLabel',
      desc: '',
      args: [],
    );
  }

  /// `ท่านสามารถดาวน์โหลดประวัติการทำธุรกรรมได้ในช่วงระยะเวลาไม่เกิน 180 วัน`
  String get transactionDownloadWarningText {
    return Intl.message(
      'ท่านสามารถดาวน์โหลดประวัติการทำธุรกรรมได้ในช่วงระยะเวลาไม่เกิน 180 วัน',
      name: 'transactionDownloadWarningText',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get transactionDownloadTimeLabel {
    return Intl.message(
      'Time',
      name: 'transactionDownloadTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get transactionDownloadEmailLabel {
    return Intl.message(
      'Email',
      name: 'transactionDownloadEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Send to email`
  String get transactionDownloadSubmitButtonLabel {
    return Intl.message(
      'Send to email',
      name: 'transactionDownloadSubmitButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `การยืนยันตัวตน %ไม่ผ่านการอนุมัติ%`
  String get kycNotPassTitle {
    return Intl.message(
      'การยืนยันตัวตน %ไม่ผ่านการอนุมัติ%',
      name: 'kycNotPassTitle',
      desc: '',
      args: [],
    );
  }

  /// `เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ จึงไม่สามารถให้บริการท่านได้`
  String get kycNotPassContent {
    return Intl.message(
      'เนื่องจากท่านมีคุณสมบัติที่เข้าเงื่อนไขการปฏิเสธ จึงไม่สามารถให้บริการท่านได้',
      name: 'kycNotPassContent',
      desc: '',
      args: [],
    );
  }

  /// `Root Detected`
  String get rootDetectMessage {
    return Intl.message(
      'Root Detected',
      name: 'rootDetectMessage',
      desc: '',
      args: [],
    );
  }

  /// `unverified`
  String get userUnverified {
    return Intl.message(
      'unverified',
      name: 'userUnverified',
      desc: '',
      args: [],
    );
  }

  /// `Unverified - Under Review`
  String get userUnderReview {
    return Intl.message(
      'Unverified - Under Review',
      name: 'userUnderReview',
      desc: '',
      args: [],
    );
  }

  /// `verified`
  String get userVerified {
    return Intl.message(
      'verified',
      name: 'userVerified',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อบริษัทหรือที่ทำงาน / สถานศึกษา`
  String get kycFundFormWorkingPlacenamePlaceholder {
    return Intl.message(
      'ชื่อบริษัทหรือที่ทำงาน / สถานศึกษา',
      name: 'kycFundFormWorkingPlacenamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `ข้อมูลไม่ถูกต้อง กรุณาตรวจสอบข้อมูล\nชื่อ, นามสกุล, วัน/เดือน/ปีเกิด, เลขบัตร ประจำตัวประชาชน, วันหมดอายุบัตร,\nเลขหลังบัตรประจำตัวประชาชน อีกครั้ง`
  String get dopaFailedMessage {
    return Intl.message(
      'ข้อมูลไม่ถูกต้อง กรุณาตรวจสอบข้อมูล\nชื่อ, นามสกุล, วัน/เดือน/ปีเกิด, เลขบัตร ประจำตัวประชาชน, วันหมดอายุบัตร,\nเลขหลังบัตรประจำตัวประชาชน อีกครั้ง',
      name: 'dopaFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `ข้อกำหนดและเงื่อนไข %ข้อมูลส่วนบุคคลที่อ่อนไหว%`
  String get kycTermSensitiveTitle {
    return Intl.message(
      'ข้อกำหนดและเงื่อนไข %ข้อมูลส่วนบุคคลที่อ่อนไหว%',
      name: 'kycTermSensitiveTitle',
      desc: '',
      args: [],
    );
  }

  /// `โปรดถ่ายภาพให้เห็นข้อมูลทั้งหมด และสามารถอ่านตัวหนังสือบนบัตรประชาชนได้`
  String get captureIdCardConfirmContent {
    return Intl.message(
      'โปรดถ่ายภาพให้เห็นข้อมูลทั้งหมด และสามารถอ่านตัวหนังสือบนบัตรประชาชนได้',
      name: 'captureIdCardConfirmContent',
      desc: '',
      args: [],
    );
  }

  /// `ถ่ายภาพใหม่`
  String get captureRetakeButton {
    return Intl.message(
      'ถ่ายภาพใหม่',
      name: 'captureRetakeButton',
      desc: '',
      args: [],
    );
  }

  /// `ตั้งค่ารหัส PIN สำเร็จ`
  String get setpinSuccessMessage {
    return Intl.message(
      'ตั้งค่ารหัส PIN สำเร็จ',
      name: 'setpinSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `ประเภทตราสารที่สามารถลงทุนได้`
  String get suiteTestResultInvestTitle {
    return Intl.message(
      'ประเภทตราสารที่สามารถลงทุนได้',
      name: 'suiteTestResultInvestTitle',
      desc: '',
      args: [],
    );
  }

  /// `ท่านต้องการผลตอบแทนจำนวนเล็กน้อยที่แน่นอน มากกว่าผลตอบแทนจำนวนมากที่ไม่แน่นอนไม่ต้องการความเสี่ยงและวัตถุประสงค์การลงทุนในระยะสั้น ๆ`
  String get suiteTestLowInvestContent1 {
    return Intl.message(
      'ท่านต้องการผลตอบแทนจำนวนเล็กน้อยที่แน่นอน มากกว่าผลตอบแทนจำนวนมากที่ไม่แน่นอนไม่ต้องการความเสี่ยงและวัตถุประสงค์การลงทุนในระยะสั้น ๆ',
      name: 'suiteTestLowInvestContent1',
      desc: '',
      args: [],
    );
  }

  /// `เหมาะที่จะลงทุนโดยการฝากเงินธนาคาร หรือตราสารหนี้ความเสี่ยงต่ำ กองทุนรวมตลาดเงินที่ลงทุนเฉพาะในประเทศ`
  String get suiteTestLowInvestContent2 {
    return Intl.message(
      'เหมาะที่จะลงทุนโดยการฝากเงินธนาคาร หรือตราสารหนี้ความเสี่ยงต่ำ กองทุนรวมตลาดเงินที่ลงทุนเฉพาะในประเทศ',
      name: 'suiteTestLowInvestContent2',
      desc: '',
      args: [],
    );
  }

  /// `ท่านสามารถรับความเสี่ยงได้น้อยเพื่อแลกกับผลตอบแทนที่เพิ่มขึ้น แต่ยังคงมุ่งเน้นปกป้องเงินลงทุนและหวังรายได้อย่างสม่ำเสมอจากการลงทุน`
  String get suiteTestMediumLowInvestContent1 {
    return Intl.message(
      'ท่านสามารถรับความเสี่ยงได้น้อยเพื่อแลกกับผลตอบแทนที่เพิ่มขึ้น แต่ยังคงมุ่งเน้นปกป้องเงินลงทุนและหวังรายได้อย่างสม่ำเสมอจากการลงทุน',
      name: 'suiteTestMediumLowInvestContent1',
      desc: '',
      args: [],
    );
  }

  /// `เหมาะที่จะลงทุนโดยการซื้อตราสารหนี้หรือตราสารทุนความเสี่ยงต่ำกองทุนรวมตลาดเงิน กองทุนรวมพันธบัตรรัญบาล`
  String get suiteTestMediumLowInvestContent2 {
    return Intl.message(
      'เหมาะที่จะลงทุนโดยการซื้อตราสารหนี้หรือตราสารทุนความเสี่ยงต่ำกองทุนรวมตลาดเงิน กองทุนรวมพันธบัตรรัญบาล',
      name: 'suiteTestMediumLowInvestContent2',
      desc: '',
      args: [],
    );
  }

  /// `ท่านสามารถรับมูลค่าการลงทุนที่ลดลงเป็นครั้งคราวได้`
  String get suiteTestHighMediumInvestContent1 {
    return Intl.message(
      'ท่านสามารถรับมูลค่าการลงทุนที่ลดลงเป็นครั้งคราวได้',
      name: 'suiteTestHighMediumInvestContent1',
      desc: '',
      args: [],
    );
  }

  /// `เหมาะที่จะลงทุนโดยการซื้อ ตราสารหนี้หรือตราสารทุนความเสี่ยงปานกลาง กองทุนรวมผสม`
  String get suiteTestHighMediumInvestContent2 {
    return Intl.message(
      'เหมาะที่จะลงทุนโดยการซื้อ ตราสารหนี้หรือตราสารทุนความเสี่ยงปานกลาง กองทุนรวมผสม',
      name: 'suiteTestHighMediumInvestContent2',
      desc: '',
      args: [],
    );
  }

  /// `ท่านสามารถรับความเสี่ยงสูงจากการผันผวนของตลาดได้ โดยสามารถรับผลขาดทุนจำนวนมากเพื่อแลกกับโอกาสในการได้รับผลตอบแทนสูงหรือผลตอบแทนระยะยาว`
  String get suiteTestHighInvestContent1 {
    return Intl.message(
      'ท่านสามารถรับความเสี่ยงสูงจากการผันผวนของตลาดได้ โดยสามารถรับผลขาดทุนจำนวนมากเพื่อแลกกับโอกาสในการได้รับผลตอบแทนสูงหรือผลตอบแทนระยะยาว',
      name: 'suiteTestHighInvestContent1',
      desc: '',
      args: [],
    );
  }

  /// `เหมาะที่จะลงทุนโดยการซื้อตราสารทุน ตราสารอนุพันธ์ หรือสินทรัพย์ดิจิทัลที่มีเสถียรภาพด้านราคา`
  String get suiteTestHighInvestContent2 {
    return Intl.message(
      'เหมาะที่จะลงทุนโดยการซื้อตราสารทุน ตราสารอนุพันธ์ หรือสินทรัพย์ดิจิทัลที่มีเสถียรภาพด้านราคา',
      name: 'suiteTestHighInvestContent2',
      desc: '',
      args: [],
    );
  }

  /// `ท่านสามารถรับความเสี่ยงสูงมากจากการผันผวนของตลาดได้ โดยสามารถรับผลขาดทุนทั้งหมดเพื่อแลกกับโอกาสได้รับผลตอบแทนเป็นทวีคูณ`
  String get suiteTestVeryHighInvestContent1 {
    return Intl.message(
      'ท่านสามารถรับความเสี่ยงสูงมากจากการผันผวนของตลาดได้ โดยสามารถรับผลขาดทุนทั้งหมดเพื่อแลกกับโอกาสได้รับผลตอบแทนเป็นทวีคูณ',
      name: 'suiteTestVeryHighInvestContent1',
      desc: '',
      args: [],
    );
  }

  /// `เหมาะที่จะลงทุนโดยการซื้อสินทรัพย์ดิจิทัล`
  String get suiteTestVeryHighInvestContent2 {
    return Intl.message(
      'เหมาะที่จะลงทุนโดยการซื้อสินทรัพย์ดิจิทัล',
      name: 'suiteTestVeryHighInvestContent2',
      desc: '',
      args: [],
    );
  }

  /// `การซื้อขายสินทรัพย์ดิจิทัลมีความผันผวนของตลาดและ ราคาภายในระยะเวลาอันรวดเร็ว ผู้ลงทุนอาจสูญเสียเงิน ลงทุนทั้งจำนวน ดังนั้น  ผู้ลงทุนควรศึกษาและทำความ เข้าใจพื้นฐานการซื้อขายด้านสินทรัพย์ดิจิทัลก่อนตัดสินใจซื้อขาย และควรติดตามข่าวสารเกี่ยวกับสินทรัพย์ดิจิทัลอยู่ เสมอระหว่างการซื้อขาย`
  String get suiteTestInvestWarningMessage {
    return Intl.message(
      'การซื้อขายสินทรัพย์ดิจิทัลมีความผันผวนของตลาดและ ราคาภายในระยะเวลาอันรวดเร็ว ผู้ลงทุนอาจสูญเสียเงิน ลงทุนทั้งจำนวน ดังนั้น  ผู้ลงทุนควรศึกษาและทำความ เข้าใจพื้นฐานการซื้อขายด้านสินทรัพย์ดิจิทัลก่อนตัดสินใจซื้อขาย และควรติดตามข่าวสารเกี่ยวกับสินทรัพย์ดิจิทัลอยู่ เสมอระหว่างการซื้อขาย',
      name: 'suiteTestInvestWarningMessage',
      desc: '',
      args: [],
    );
  }

  /// `แบบประเมินใช้เวลา  5-10 นาที`
  String get preSuiteTestStep1 {
    return Intl.message(
      'แบบประเมินใช้เวลา  5-10 นาที',
      name: 'preSuiteTestStep1',
      desc: '',
      args: [],
    );
  }

  /// `แบบประเมินนี้จัดทำขึ้นเพื่อทำความรู้จักและประเมินความสามารถในการรับความเสี่ยงของผู้ลงทุน อันจะนําไปสู่การตัดสินใจลงทุนที่เหมาะสมกับตนเอง`
  String get preSuiteTestStep2 {
    return Intl.message(
      'แบบประเมินนี้จัดทำขึ้นเพื่อทำความรู้จักและประเมินความสามารถในการรับความเสี่ยงของผู้ลงทุน อันจะนําไปสู่การตัดสินใจลงทุนที่เหมาะสมกับตนเอง',
      name: 'preSuiteTestStep2',
      desc: '',
      args: [],
    );
  }

  /// `ขอให้ท่านเลือกคำตอบที่คิดว่าเหมาะสมกับท่านมากที่สุด และตอบคำถามให้ครบถ้วนทุกข้อ`
  String get preSuiteTestStep3 {
    return Intl.message(
      'ขอให้ท่านเลือกคำตอบที่คิดว่าเหมาะสมกับท่านมากที่สุด และตอบคำถามให้ครบถ้วนทุกข้อ',
      name: 'preSuiteTestStep3',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStaredButton {
    return Intl.message(
      'Get Started',
      name: 'getStaredButton',
      desc: '',
      args: [],
    );
  }

  /// `แหล่งเรียนรู้เพิ่มเติม`
  String get knowledgeTestResultMoreInformationLabel {
    return Intl.message(
      'แหล่งเรียนรู้เพิ่มเติม',
      name: 'knowledgeTestResultMoreInformationLabel',
      desc: '',
      args: [],
    );
  }

  /// `เลือก %อาชีพปัจจุบัน%`
  String get selectOccupationTitle {
    return Intl.message(
      'เลือก %อาชีพปัจจุบัน%',
      name: 'selectOccupationTitle',
      desc: '',
      args: [],
    );
  }

  /// `คลิกดูรายละเอียด >`
  String get termMoreDetailButton {
    return Intl.message(
      'คลิกดูรายละเอียด >',
      name: 'termMoreDetailButton',
      desc: '',
      args: [],
    );
  }

  /// `ค้นหา`
  String get searchPlaeholder {
    return Intl.message(
      'ค้นหา',
      name: 'searchPlaeholder',
      desc: '',
      args: [],
    );
  }

  /// `จำนวนคริปโต/โทเคนสุทธิที่จะได้รับ อาจมีการเปลี่ยนแปลง ขึ้นอยู่กับการคำนวณราคาแลกเปลี่ยน ณ เวลาที่บริษัทฯ ได้ รับชำระแล้ว`
  String get buyWarningMessage1 {
    return Intl.message(
      'จำนวนคริปโต/โทเคนสุทธิที่จะได้รับ อาจมีการเปลี่ยนแปลง ขึ้นอยู่กับการคำนวณราคาแลกเปลี่ยน ณ เวลาที่บริษัทฯ ได้ รับชำระแล้ว',
      name: 'buyWarningMessage1',
      desc: '',
      args: [],
    );
  }

  /// `ยอดซื้อไม่เกิน 2,000,000 บาท ได้รับคริปโต/โทเคนภายใน 1 นาที - 24 ชั่วโมง\n\nยอดซื้อเกิน 2,000,000 บาท ได้รับคริปโต/โทเคนภายใน 1 ชั่วโมง - 48 ชั่วโมงไม่รวมวันหยุดเสาร์-อาทิตย์ และวันหยุดนักขัตฤกษ์`
  String get buyWarningMessage2 {
    return Intl.message(
      'ยอดซื้อไม่เกิน 2,000,000 บาท ได้รับคริปโต/โทเคนภายใน 1 นาที - 24 ชั่วโมง\n\nยอดซื้อเกิน 2,000,000 บาท ได้รับคริปโต/โทเคนภายใน 1 ชั่วโมง - 48 ชั่วโมงไม่รวมวันหยุดเสาร์-อาทิตย์ และวันหยุดนักขัตฤกษ์',
      name: 'buyWarningMessage2',
      desc: '',
      args: [],
    );
  }

  /// `จำนวนเงินสุทธิที่จะได้รับ อาจมีการเปลี่ยนแปลงขึ้นอยู่กับ\n\n• จำนวนเงิน ที่บริษัทฯ ได้รับตามจริง\n• การคำนวณราคาแลกเปลี่ยน ณ เวลาที่บริษัทฯ ได้รับ  ชำระแล้ว`
  String get sellWarningMessage1 {
    return Intl.message(
      'จำนวนเงินสุทธิที่จะได้รับ อาจมีการเปลี่ยนแปลงขึ้นอยู่กับ\n\n• จำนวนเงิน ที่บริษัทฯ ได้รับตามจริง\n• การคำนวณราคาแลกเปลี่ยน ณ เวลาที่บริษัทฯ ได้รับ  ชำระแล้ว',
      name: 'sellWarningMessage1',
      desc: '',
      args: [],
    );
  }

  /// `ยอดซื้อไม่เกิน 2,000,000 บาท ได้รับเงินภายใน 1 นาที - 24 ชั่วโมง\n\nยอดซื้อเกิน 2,000,000 บาท ได้รับคริปโต/โทเคนภายใน 1 ชั่วโมง - 48 ชั่วโมงไม่รวมวันหยุดเสาร์-อาทิตย์ และวันหยุดนักขัตฤกษ์`
  String get sellWarningMessage2 {
    return Intl.message(
      'ยอดซื้อไม่เกิน 2,000,000 บาท ได้รับเงินภายใน 1 นาที - 24 ชั่วโมง\n\nยอดซื้อเกิน 2,000,000 บาท ได้รับคริปโต/โทเคนภายใน 1 ชั่วโมง - 48 ชั่วโมงไม่รวมวันหยุดเสาร์-อาทิตย์ และวันหยุดนักขัตฤกษ์',
      name: 'sellWarningMessage2',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน %ไม่สำเร็จ%`
  String get ndidModalNotSuccessTitle {
    return Intl.message(
      'ยืนยันตัวตน %ไม่สำเร็จ%',
      name: 'ndidModalNotSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `ท่านยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด\n\nท่านสามารถเลือกผู้ให้บริการยืนยันตัวตน\nช่องทางแอปพลิเคชันได้อีก 1 ครั้ง`
  String get ndidModalTryagainMessage {
    return Intl.message(
      'ท่านยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด\n\nท่านสามารถเลือกผู้ให้บริการยืนยันตัวตน\nช่องทางแอปพลิเคชันได้อีก 1 ครั้ง',
      name: 'ndidModalTryagainMessage',
      desc: '',
      args: [],
    );
  }

  /// `สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net`
  String get ndidModalContactHint {
    return Intl.message(
      'สอบถามข้อมูลเพิ่มเติม ทุกวันทําการ 9.00 - 17.00 น. โทร 0661101109 อีเมล support@1109x.net',
      name: 'ndidModalContactHint',
      desc: '',
      args: [],
    );
  }

  /// `ท่านยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด\n\nหากท่านต้องการยืนยันตัวตนอีกครั้ง\nกรุณาติดต่อเจ้าหน้าที่`
  String get ndidModalTimeoutMessage {
    return Intl.message(
      'ท่านยืนยันตัวตนไม่สําเร็จในเวลาที่กําหนด\n\nหากท่านต้องการยืนยันตัวตนอีกครั้ง\nกรุณาติดต่อเจ้าหน้าที่',
      name: 'ndidModalTimeoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `เมื่อชำระค่าดำเนินการยืนยันตัวตนแล้ว ท่านต้องยืนยันตัวตนให้สำเร็จภายใน 30 วัน\nหากยืนยันตัวตนไม่สำเร็จภายในเวลาที่กำหนด ระบบจะยกเลิกการยืนยันตัวตน และท่านต้อง ชำระค่าดำเนินการยืนยันตัวตนอีกครั้ง`
  String get ndidWarningMessage {
    return Intl.message(
      'เมื่อชำระค่าดำเนินการยืนยันตัวตนแล้ว ท่านต้องยืนยันตัวตนให้สำเร็จภายใน 30 วัน\nหากยืนยันตัวตนไม่สำเร็จภายในเวลาที่กำหนด ระบบจะยกเลิกการยืนยันตัวตน และท่านต้อง ชำระค่าดำเนินการยืนยันตัวตนอีกครั้ง',
      name: 'ndidWarningMessage',
      desc: '',
      args: [],
    );
  }

  /// `ช่องทางการชำระ`
  String get ndidPaymentChannelLabel {
    return Intl.message(
      'ช่องทางการชำระ',
      name: 'ndidPaymentChannelLabel',
      desc: '',
      args: [],
    );
  }

  /// `เริ่มยืนยันตัวตน`
  String get ndidStartButton {
    return Intl.message(
      'เริ่มยืนยันตัวตน',
      name: 'ndidStartButton',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันตัวตน`
  String get sideMenuKycLinkButtonLabel {
    return Intl.message(
      'ยืนยันตัวตน',
      name: 'sideMenuKycLinkButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `บัญชี`
  String get sideMenuPersonalAccountInformationLabel {
    return Intl.message(
      'บัญชี',
      name: 'sideMenuPersonalAccountInformationLabel',
      desc: '',
      args: [],
    );
  }

  /// `ตั้งค่า`
  String get sideMenuSettingLabel {
    return Intl.message(
      'ตั้งค่า',
      name: 'sideMenuSettingLabel',
      desc: '',
      args: [],
    );
  }

  /// `ช่วยเหลือ`
  String get sideMenuHelpLabel {
    return Intl.message(
      'ช่วยเหลือ',
      name: 'sideMenuHelpLabel',
      desc: '',
      args: [],
    );
  }

  /// `อื่นๆ`
  String get sideMenuOtherLabel {
    return Intl.message(
      'อื่นๆ',
      name: 'sideMenuOtherLabel',
      desc: '',
      args: [],
    );
  }

  /// `ออกจากระบบ`
  String get sideMenuLogoutLabel {
    return Intl.message(
      'ออกจากระบบ',
      name: 'sideMenuLogoutLabel',
      desc: '',
      args: [],
    );
  }

  /// `ออกจากระบบ`
  String get logoutButton {
    return Intl.message(
      'ออกจากระบบ',
      name: 'logoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Not Approved`
  String get userNotApprove {
    return Intl.message(
      'Not Approved',
      name: 'userNotApprove',
      desc: '',
      args: [],
    );
  }

  /// `รายละเอียด`
  String get detailNotApproveLinkButton {
    return Intl.message(
      'รายละเอียด',
      name: 'detailNotApproveLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `ก่อนทำการซื้อขาย โปรดยืนยันบัญชีธนาคารของท่าน ที่เมนู การตั้งค่า > บัญชีธนาคาร หรือ คลิกที่นี่`
  String get ndidCompleteMessage {
    return Intl.message(
      'ก่อนทำการซื้อขาย โปรดยืนยันบัญชีธนาคารของท่าน ที่เมนู การตั้งค่า > บัญชีธนาคาร หรือ คลิกที่นี่',
      name: 'ndidCompleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `บัญชีโอนเงิน`
  String get confirmOrderBankAccountTransansferLabel {
    return Intl.message(
      'บัญชีโอนเงิน',
      name: 'confirmOrderBankAccountTransansferLabel',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาโอนเงินจากบัญชีธนาคารที่ท่านเลือกและได้รับการยืนยันจากเจ้าหน้าที่แล้วเท่านั้น`
  String get selectPaymentDescription {
    return Intl.message(
      'กรุณาโอนเงินจากบัญชีธนาคารที่ท่านเลือกและได้รับการยืนยันจากเจ้าหน้าที่แล้วเท่านั้น',
      name: 'selectPaymentDescription',
      desc: '',
      args: [],
    );
  }

  /// `Order %Completed%`
  String get orderCompletedNavTitle {
    return Intl.message(
      'Order %Completed%',
      name: 'orderCompletedNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been cancelled`
  String get orderCancelDescription {
    return Intl.message(
      'Your order has been cancelled',
      name: 'orderCancelDescription',
      desc: '',
      args: [],
    );
  }

  /// `Your remaining daily buy limit is @value baht`
  String get spendLimitBuyWarning {
    return Intl.message(
      'Your remaining daily buy limit is @value baht',
      name: 'spendLimitBuyWarning',
      desc: '',
      args: [],
    );
  }

  /// `Your remaining daily sell limit is @value baht`
  String get spendLimitSellWarning {
    return Intl.message(
      'Your remaining daily sell limit is @value baht',
      name: 'spendLimitSellWarning',
      desc: '',
      args: [],
    );
  }

  /// `ก.ล.ต. Crypto Academy`
  String get knowledgeInformation1 {
    return Intl.message(
      'ก.ล.ต. Crypto Academy',
      name: 'knowledgeInformation1',
      desc: '',
      args: [],
    );
  }

  /// `Smart to invest`
  String get knowledgeInformation2 {
    return Intl.message(
      'Smart to invest',
      name: 'knowledgeInformation2',
      desc: '',
      args: [],
    );
  }

  /// `ลบบัญชี`
  String get terminateAccountTitle {
    return Intl.message(
      'ลบบัญชี',
      name: 'terminateAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `เงื่อนไขการลบบัญชีผู้ใช้งาน 1109x`
  String get terminateAccountContentTitle {
    return Intl.message(
      'เงื่อนไขการลบบัญชีผู้ใช้งาน 1109x',
      name: 'terminateAccountContentTitle',
      desc: '',
      args: [],
    );
  }

  /// `ต้องไม่มีรายการซื้อขายที่ยังดำเนินการไม่เสร็จสิ้น`
  String get terminateAccountConsent1 {
    return Intl.message(
      'ต้องไม่มีรายการซื้อขายที่ยังดำเนินการไม่เสร็จสิ้น',
      name: 'terminateAccountConsent1',
      desc: '',
      args: [],
    );
  }

  /// `เมื่อการลบบัญชีเสร็จสมบูรณ์แล้ว ข้อมูลเกี่ยวกับการใช้งานบัญชี 1109x ของท่านบนแอปพลิเคชัน รวมถึงสิทธิประโยชน์ต่าง ๆ ที่คงเหลือ จะถูกลบออกจากแอปพลิเคชัน 1109x ทั้งหมด และไม่สามารถเรียกคืนได้แต่อย่างใด`
  String get terminateAccountConsent2 {
    return Intl.message(
      'เมื่อการลบบัญชีเสร็จสมบูรณ์แล้ว ข้อมูลเกี่ยวกับการใช้งานบัญชี 1109x ของท่านบนแอปพลิเคชัน รวมถึงสิทธิประโยชน์ต่าง ๆ ที่คงเหลือ จะถูกลบออกจากแอปพลิเคชัน 1109x ทั้งหมด และไม่สามารถเรียกคืนได้แต่อย่างใด',
      name: 'terminateAccountConsent2',
      desc: '',
      args: [],
    );
  }

  /// `หากท่านประสงค์จะใช้งานแอปพลิเคชัน 1109x อีกในอนาคต ท่านจะต้องสร้างบัญชีผู้ใช้งาน 1109x และยืนยันตัวตนใหม่อีกครั้ง`
  String get terminateAccountConsent3 {
    return Intl.message(
      'หากท่านประสงค์จะใช้งานแอปพลิเคชัน 1109x อีกในอนาคต ท่านจะต้องสร้างบัญชีผู้ใช้งาน 1109x และยืนยันตัวตนใหม่อีกครั้ง',
      name: 'terminateAccountConsent3',
      desc: '',
      args: [],
    );
  }

  /// `ภายใน 14 วัน หลังจากยืนยันการลบบัญชีผู้ใช้งาน 1109x แล้ว ข้อมูลทั้งหมดจะถูกลบออกจากบัญชีผู้ใช้งาน 1109x บนแอปพลิเคชัน โดยบริษัทฯ จะยังเก็บข้อมูลไว้เท่าที่จำเป็นตามกฎหมาย`
  String get terminateAccountConsent4 {
    return Intl.message(
      'ภายใน 14 วัน หลังจากยืนยันการลบบัญชีผู้ใช้งาน 1109x แล้ว ข้อมูลทั้งหมดจะถูกลบออกจากบัญชีผู้ใช้งาน 1109x บนแอปพลิเคชัน โดยบริษัทฯ จะยังเก็บข้อมูลไว้เท่าที่จำเป็นตามกฎหมาย',
      name: 'terminateAccountConsent4',
      desc: '',
      args: [],
    );
  }

  /// `ลบบัญชีผู้ใช้งาน 1109x สำเร็จ`
  String get terminateAccountSuccess {
    return Intl.message(
      'ลบบัญชีผู้ใช้งาน 1109x สำเร็จ',
      name: 'terminateAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `เหรียญ`
  String get coin {
    return Intl.message(
      'เหรียญ',
      name: 'coin',
      desc: '',
      args: [],
    );
  }

  /// `ราคาซื้อ (บาท)`
  String get buyPrice {
    return Intl.message(
      'ราคาซื้อ (บาท)',
      name: 'buyPrice',
      desc: '',
      args: [],
    );
  }

  /// `ราคาขาย (บาท)`
  String get sellPrice {
    return Intl.message(
      'ราคาขาย (บาท)',
      name: 'sellPrice',
      desc: '',
      args: [],
    );
  }

  /// `ราคา @value`
  String get coinPriceLabel {
    return Intl.message(
      'ราคา @value',
      name: 'coinPriceLabel',
      desc: '',
      args: [],
    );
  }

  /// `หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล`
  String get privacyTitle {
    return Intl.message(
      'หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล',
      name: 'privacyTitle',
      desc: '',
      args: [],
    );
  }

  /// `รหัสประเทศ`
  String get dialCodeLabel {
    return Intl.message(
      'รหัสประเทศ',
      name: 'dialCodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `รหัสเชิญ (จำเป็น)`
  String get inviteCodeLabel {
    return Intl.message(
      'รหัสเชิญ (จำเป็น)',
      name: 'inviteCodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `เราใช้เบอร์มือถือของท่านเพื่อยืนยันตัวตน และเพิ่มความปลอดภัยในการทำธุรกรรม`
  String get phoneAuthDescription {
    return Intl.message(
      'เราใช้เบอร์มือถือของท่านเพื่อยืนยันตัวตน และเพิ่มความปลอดภัยในการทำธุรกรรม',
      name: 'phoneAuthDescription',
      desc: '',
      args: [],
    );
  }

  /// `812345678`
  String get phonePlaceholder {
    return Intl.message(
      '812345678',
      name: 'phonePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `กรอกรหัสเชิญ`
  String get inviteCodePlaceholder {
    return Intl.message(
      'กรอกรหัสเชิญ',
      name: 'inviteCodePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เบอร์โทรศัพท์มือถือไม่ถูกต้อง`
  String get phoneNumberWrongFormat {
    return Intl.message(
      'เบอร์โทรศัพท์มือถือไม่ถูกต้อง',
      name: 'phoneNumberWrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `ขณะนี้ 1109x เปิดให้บริการสำหรับลูกค้าที่ลงทะเบียนและกรอก invitation code ถูกต้องเท่านั้น`
  String get inviteErrorDialogDescription {
    return Intl.message(
      'ขณะนี้ 1109x เปิดให้บริการสำหรับลูกค้าที่ลงทะเบียนและกรอก invitation code ถูกต้องเท่านั้น',
      name: 'inviteErrorDialogDescription',
      desc: '',
      args: [],
    );
  }

  /// `คริปโทเคอร์เรนซีและโทเคนดิจิทัลมีความเสี่ยงสูง ท่านอาจสูญเสียเงินลงทุนได้ทั้งจํานวน โปรดศึกษาและลงทุนให้เหมาะสมกับระดับความเสี่ยงที่ยอมรับได้`
  String get gettingStartedWarningText {
    return Intl.message(
      'คริปโทเคอร์เรนซีและโทเคนดิจิทัลมีความเสี่ยงสูง ท่านอาจสูญเสียเงินลงทุนได้ทั้งจํานวน โปรดศึกษาและลงทุนให้เหมาะสมกับระดับความเสี่ยงที่ยอมรับได้',
      name: 'gettingStartedWarningText',
      desc: '',
      args: [],
    );
  }

  /// `ยินดีต้อนรับ`
  String get signInSectionTitle {
    return Intl.message(
      'ยินดีต้อนรับ',
      name: 'signInSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียนหรือเข้าสู่ระบบเพื่อเริ่มซื้อขายกับเรา`
  String get signInSectionSubtitle {
    return Intl.message(
      'ลงทะเบียนหรือเข้าสู่ระบบเพื่อเริ่มซื้อขายกับเรา',
      name: 'signInSectionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียน / เข้าสู่ระบบ`
  String get signInSectionButton {
    return Intl.message(
      'ลงทะเบียน / เข้าสู่ระบบ',
      name: 'signInSectionButton',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาเช็คภาพของท่านให้เห็นใบหน้าอย่างชัดเจน ไม่เบลอ ไม่สวมหมวก และแว่นตา`
  String get selfieConfirmText {
    return Intl.message(
      'กรุณาเช็คภาพของท่านให้เห็นใบหน้าอย่างชัดเจน ไม่เบลอ ไม่สวมหมวก และแว่นตา',
      name: 'selfieConfirmText',
      desc: '',
      args: [],
    );
  }

  /// `เริ่มทำแบบประเมิน`
  String get startEvaluationFormButton {
    return Intl.message(
      'เริ่มทำแบบประเมิน',
      name: 'startEvaluationFormButton',
      desc: '',
      args: [],
    );
  }

  /// `ไม่สามารถยืนยันข้อมูลได้`
  String get dopaFailedTitle {
    return Intl.message(
      'ไม่สามารถยืนยันข้อมูลได้',
      name: 'dopaFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `ซื้อ / ขาย`
  String get buySellFloatingMenuLabel {
    return Intl.message(
      'ซื้อ / ขาย',
      name: 'buySellFloatingMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ซื้อ / ขาย สินทรัพย์ดิจิทัล`
  String get buySellFloatingMenuSubtitle {
    return Intl.message(
      'ซื้อ / ขาย สินทรัพย์ดิจิทัล',
      name: 'buySellFloatingMenuSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `ประวัติ`
  String get HistoryMenuLabel {
    return Intl.message(
      'ประวัติ',
      name: 'HistoryMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ประวัติรายการซื้อ / ขาย`
  String get HistoryMenuSubtitle {
    return Intl.message(
      'ประวัติรายการซื้อ / ขาย',
      name: 'HistoryMenuSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `เลือก`
  String get SelectCoinNavTitle {
    return Intl.message(
      'เลือก',
      name: 'SelectCoinNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ประวัติ`
  String get HistoryNavTitle {
    return Intl.message(
      'ประวัติ',
      name: 'HistoryNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ซื้อ`
  String get HistoryTabBuy {
    return Intl.message(
      'ซื้อ',
      name: 'HistoryTabBuy',
      desc: '',
      args: [],
    );
  }

  /// `ขาย`
  String get HistoryTabSell {
    return Intl.message(
      'ขาย',
      name: 'HistoryTabSell',
      desc: '',
      args: [],
    );
  }

  /// `ขอประวัติการทำธุรกรรม`
  String get DownloadTransactionNavTitle {
    return Intl.message(
      'ขอประวัติการทำธุรกรรม',
      name: 'DownloadTransactionNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ช่วงเวลา`
  String get DownloadTransactionTimeLabel {
    return Intl.message(
      'ช่วงเวลา',
      name: 'DownloadTransactionTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `อีเมล`
  String get DownloadTransactionEmailLabel {
    return Intl.message(
      'อีเมล',
      name: 'DownloadTransactionEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `ส่งคำขอ`
  String get DownloadTransactionSubmitButton {
    return Intl.message(
      'ส่งคำขอ',
      name: 'DownloadTransactionSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `การซื้อขายที่ดำเนินอยู๋`
  String get OpenedTransaction {
    return Intl.message(
      'การซื้อขายที่ดำเนินอยู๋',
      name: 'OpenedTransaction',
      desc: '',
      args: [],
    );
  }

  /// `คำแนะนำในการถ่ายภาพใบหน้า`
  String get selfieIntroTitle {
    return Intl.message(
      'คำแนะนำในการถ่ายภาพใบหน้า',
      name: 'selfieIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `%ไม่% สวมหมวก`
  String get selfieIntroText1 {
    return Intl.message(
      '%ไม่% สวมหมวก',
      name: 'selfieIntroText1',
      desc: '',
      args: [],
    );
  }

  /// `%ไม่% สวมหน้ากากอนามัย`
  String get selfieIntroText2 {
    return Intl.message(
      '%ไม่% สวมหน้ากากอนามัย',
      name: 'selfieIntroText2',
      desc: '',
      args: [],
    );
  }

  /// `%ไม่% สวมแว่นตาหรือแว่นตากันแดด`
  String get selfieIntroText3 {
    return Intl.message(
      '%ไม่% สวมแว่นตาหรือแว่นตากันแดด',
      name: 'selfieIntroText3',
      desc: '',
      args: [],
    );
  }

  /// `%ไม่% หลับตา`
  String get selfieIntroText4 {
    return Intl.message(
      '%ไม่% หลับตา',
      name: 'selfieIntroText4',
      desc: '',
      args: [],
    );
  }

  /// `%ไม่% อยู่ในที่ๆไม่มีแสงหรือแสงน้อย`
  String get selfieIntroText5 {
    return Intl.message(
      '%ไม่% อยู่ในที่ๆไม่มีแสงหรือแสงน้อย',
      name: 'selfieIntroText5',
      desc: '',
      args: [],
    );
  }

  /// `บัญชีธนาคาร`
  String get userBankListTitle {
    return Intl.message(
      'บัญชีธนาคาร',
      name: 'userBankListTitle',
      desc: '',
      args: [],
    );
  }

  /// `ขอเพิ่มวงเงิน`
  String get financialAmountSubMenuLabel {
    return Intl.message(
      'ขอเพิ่มวงเงิน',
      name: 'financialAmountSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ขอแก้ไขข้อมูล`
  String get personalInformationSubMenuLabel {
    return Intl.message(
      'ขอแก้ไขข้อมูล',
      name: 'personalInformationSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `เปลี่ยนรหัส PIN`
  String get resetPinSubMenuLabel {
    return Intl.message(
      'เปลี่ยนรหัส PIN',
      name: 'resetPinSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ลบบัญชี`
  String get deleteAccountSubMenuLabel {
    return Intl.message(
      'ลบบัญชี',
      name: 'deleteAccountSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `แชทกับเรา`
  String get chatWithUsSubMenuLabel {
    return Intl.message(
      'แชทกับเรา',
      name: 'chatWithUsSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `คำถามที่พบบ่อย (FAQ)`
  String get faqSubMenuLabel {
    return Intl.message(
      'คำถามที่พบบ่อย (FAQ)',
      name: 'faqSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `สารบัญเหรียญ`
  String get coinInformationSubMenuLabel {
    return Intl.message(
      'สารบัญเหรียญ',
      name: 'coinInformationSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ค่าธรรมเนียม`
  String get feeInformationSubMenuLabel {
    return Intl.message(
      'ค่าธรรมเนียม',
      name: 'feeInformationSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ติดต่อเรา`
  String get contactUsSubMenuLabel {
    return Intl.message(
      'ติดต่อเรา',
      name: 'contactUsSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `แจ้งเบาะแส/ข้อร้องเรียน`
  String get reportClueSubMenuLabel {
    return Intl.message(
      'แจ้งเบาะแส/ข้อร้องเรียน',
      name: 'reportClueSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ข้อตกลงการใช้บริการ`
  String get termConditionSubMenuLabel {
    return Intl.message(
      'ข้อตกลงการใช้บริการ',
      name: 'termConditionSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล`
  String get privacyPolicySubMenuLabel {
    return Intl.message(
      'หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล',
      name: 'privacyPolicySubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `บัญชีธนาคาร`
  String get userBankAccountSubMenuLabel {
    return Intl.message(
      'บัญชีธนาคาร',
      name: 'userBankAccountSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ข้อมูลบัญชี`
  String get accountInformationSubMenuLabel {
    return Intl.message(
      'ข้อมูลบัญชี',
      name: 'accountInformationSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `จัดการบัญชี`
  String get accountManageSubMenuLabel {
    return Intl.message(
      'จัดการบัญชี',
      name: 'accountManageSubMenuLabel',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียน`
  String get signUpButton {
    return Intl.message(
      'ลงทะเบียน',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `เข้าสู่ระบบ`
  String get loginButton {
    return Intl.message(
      'เข้าสู่ระบบ',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `ข้าม / ยังไม่อยากลงทะเบียน?`
  String get continueAsGuestButton {
    return Intl.message(
      'ข้าม / ยังไม่อยากลงทะเบียน?',
      name: 'continueAsGuestButton',
      desc: '',
      args: [],
    );
  }

  /// `เข้าสู่ระบบ`
  String get loginWithPasswordNavTitle {
    return Intl.message(
      'เข้าสู่ระบบ',
      name: 'loginWithPasswordNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `อีเมล`
  String get emailTextFieldPlaceholder {
    return Intl.message(
      'อีเมล',
      name: 'emailTextFieldPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `รหัสผ่าน`
  String get passwordTextFieldPlaceholder {
    return Intl.message(
      'รหัสผ่าน',
      name: 'passwordTextFieldPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `เข้าสู่ระบบ`
  String get loginSubmitButton {
    return Intl.message(
      'เข้าสู่ระบบ',
      name: 'loginSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียน`
  String get signUpLinkButton {
    return Intl.message(
      'ลงทะเบียน',
      name: 'signUpLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `ลืมรหัสผ่าน?`
  String get forgotPasswordLinkButton {
    return Intl.message(
      'ลืมรหัสผ่าน?',
      name: 'forgotPasswordLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียน`
  String get signUpNavTitle {
    return Intl.message(
      'ลงทะเบียน',
      name: 'signUpNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ต้องมีอย่างน้อย 8 ตัวอักษร`
  String get setPasswordCondition1Text {
    return Intl.message(
      'ต้องมีอย่างน้อย 8 ตัวอักษร',
      name: 'setPasswordCondition1Text',
      desc: '',
      args: [],
    );
  }

  /// `ต้องประกอบไปด้วย ภาษาอังกฤษตัวพิมพ์เล็ก,\nภาษาอังกฤษตัวพิมพ์ใหญ่, ตัวเลข และอักขระพิเศษ`
  String get setPasswordCondition2Text {
    return Intl.message(
      'ต้องประกอบไปด้วย ภาษาอังกฤษตัวพิมพ์เล็ก,\nภาษาอังกฤษตัวพิมพ์ใหญ่, ตัวเลข และอักขระพิเศษ',
      name: 'setPasswordCondition2Text',
      desc: '',
      args: [],
    );
  }

  /// `รหัสเชิญ (จำเป็น)`
  String get inviteCodeTextFieldPlaceholder {
    return Intl.message(
      'รหัสเชิญ (จำเป็น)',
      name: 'inviteCodeTextFieldPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `ฉันได้อ่านและยอมรับ %ข้อตกลงการใช้บริการ% และ`
  String get acceptTermAndPrivacyText {
    return Intl.message(
      'ฉันได้อ่านและยอมรับ %ข้อตกลงการใช้บริการ% และ',
      name: 'acceptTermAndPrivacyText',
      desc: '',
      args: [],
    );
  }

  /// `%หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล% ของ 1109x`
  String get acceptTermAndPrivacy2Text {
    return Intl.message(
      '%หนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล% ของ 1109x',
      name: 'acceptTermAndPrivacy2Text',
      desc: '',
      args: [],
    );
  }

  /// `ลงทะเบียนด้วยอีเมล`
  String get signUpSubmitButton {
    return Intl.message(
      'ลงทะเบียนด้วยอีเมล',
      name: 'signUpSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันอีเมล`
  String get verifyEmailNavTitle {
    return Intl.message(
      'ยืนยันอีเมล',
      name: 'verifyEmailNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาตรวจสอบ\nอีเมลของท่าน`
  String get verifyEmailTitle {
    return Intl.message(
      'กรุณาตรวจสอบ\nอีเมลของท่าน',
      name: 'verifyEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรุณากดลิงค์ยืนยันที่ส่งให้ผ่านอีเมล @value`
  String get verifyEmailUserLabel {
    return Intl.message(
      'กรุณากดลิงค์ยืนยันที่ส่งให้ผ่านอีเมล @value',
      name: 'verifyEmailUserLabel',
      desc: '',
      args: [],
    );
  }

  /// `เมื่อกดลิงค์ยืนยันที่อีเมลแล้ว\nโปรดกลับมาทำรายการต่อที่แอปพลิเคชั่น 1109x`
  String get verifyEmailDescription {
    return Intl.message(
      'เมื่อกดลิงค์ยืนยันที่อีเมลแล้ว\nโปรดกลับมาทำรายการต่อที่แอปพลิเคชั่น 1109x',
      name: 'verifyEmailDescription',
      desc: '',
      args: [],
    );
  }

  /// `ส่งอีกครั้ง`
  String get verifyEmailResendButton {
    return Intl.message(
      'ส่งอีกครั้ง',
      name: 'verifyEmailResendButton',
      desc: '',
      args: [],
    );
  }

  /// `เข้าสู่ระบบ`
  String get loginLinkButton {
    return Intl.message(
      'เข้าสู่ระบบ',
      name: 'loginLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `ไม่สามารถลงทะเบียนได้`
  String get existUserAlreadyPopupTitle {
    return Intl.message(
      'ไม่สามารถลงทะเบียนได้',
      name: 'existUserAlreadyPopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `ขออภัย อีเมลนี้ลงทะเบียนในระบบแล้ว\nโปรดใช้อีเมลอื่นในการลงทะเบียน\nหรือเข้าสู่ระบบเพื่อใช้งาน 1109x ได้เลย`
  String get existUserAlreadyPopupDesc {
    return Intl.message(
      'ขออภัย อีเมลนี้ลงทะเบียนในระบบแล้ว\nโปรดใช้อีเมลอื่นในการลงทะเบียน\nหรือเข้าสู่ระบบเพื่อใช้งาน 1109x ได้เลย',
      name: 'existUserAlreadyPopupDesc',
      desc: '',
      args: [],
    );
  }

  /// `ลืมรหัสผ่าน`
  String get forgotPasswordNavTitle {
    return Intl.message(
      'ลืมรหัสผ่าน',
      name: 'forgotPasswordNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันอีเมล`
  String get sendResetPasswordNavTitle {
    return Intl.message(
      'ยืนยันอีเมล',
      name: 'sendResetPasswordNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรุณาตรวจสอบ\nเมลของท่าน`
  String get sendResetPasswordTitle {
    return Intl.message(
      'กรุณาตรวจสอบ\nเมลของท่าน',
      name: 'sendResetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `กรุณากดลิงค์ที่ส่งให้ผ่านอีเมล @value`
  String get sendResetPasswordDescription {
    return Intl.message(
      'กรุณากดลิงค์ที่ส่งให้ผ่านอีเมล @value',
      name: 'sendResetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `เมื่อกดลิงค์ที่อีเมลแล้ว\nโปรดกลับมาทำรายการต่อที่แอปพลิเคชั่น 1109x`
  String get sendResetPasswordHint {
    return Intl.message(
      'เมื่อกดลิงค์ที่อีเมลแล้ว\nโปรดกลับมาทำรายการต่อที่แอปพลิเคชั่น 1109x',
      name: 'sendResetPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `ส่งอีกครั้ง`
  String get sendResetPasswordEmailButton {
    return Intl.message(
      'ส่งอีกครั้ง',
      name: 'sendResetPasswordEmailButton',
      desc: '',
      args: [],
    );
  }

  /// `ไม่มีรายการแสดง`
  String get coinEmptyWarning {
    return Intl.message(
      'ไม่มีรายการแสดง',
      name: 'coinEmptyWarning',
      desc: '',
      args: [],
    );
  }

  /// `โปรดอ่านรายละเอียดอื่นๆ และสิทธิในหนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล`
  String get kycPdpaPrivacyPolicy {
    return Intl.message(
      'โปรดอ่านรายละเอียดอื่นๆ และสิทธิในหนังสือแจ้งการคุ้มครองข้อมูลส่วนบุคคล',
      name: 'kycPdpaPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `ลืมรหัส PIN?`
  String get forgotPinAlertTitle {
    return Intl.message(
      'ลืมรหัส PIN?',
      name: 'forgotPinAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `โปรดเข้าสู่ระบบใหม่ เพื่อตั้งรหัส PIN\nใหม่อีกครั้ง`
  String get forgotPinAlertDesc {
    return Intl.message(
      'โปรดเข้าสู่ระบบใหม่ เพื่อตั้งรหัส PIN\nใหม่อีกครั้ง',
      name: 'forgotPinAlertDesc',
      desc: '',
      args: [],
    );
  }

  /// `รูปแบบอีเมลถูกต้อง`
  String get emailFormatCondition {
    return Intl.message(
      'รูปแบบอีเมลถูกต้อง',
      name: 'emailFormatCondition',
      desc: '',
      args: [],
    );
  }

  /// `ยืนยันอีเมลสำเร็จ`
  String get emailVerifiedSuccess {
    return Intl.message(
      'ยืนยันอีเมลสำเร็จ',
      name: 'emailVerifiedSuccess',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'th'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
