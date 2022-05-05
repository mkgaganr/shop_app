import 'dart:ffi';

class OrderProcess {
  int id;
  int srNo;
  String processName;
  String processId;
  String barcodeLink;
  String barcodeImg;
  double targetCost;
  double cost;
  String processDrawing;
  String startDate;
  String endDate;
  bool completed;
  String woDate;
  Vendorcode vendorcode;

  OrderProcess(
      {this.id,
      this.srNo,
      this.processName,
      this.processId,
      this.barcodeLink,
      this.barcodeImg,
      this.targetCost,
      this.cost,
      this.processDrawing,
      this.startDate,
      this.endDate,
      this.completed,
      this.woDate,
      this.vendorcode});

  OrderProcess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    srNo = json['sr_no'];
    processName = json['process_name'];
    processId = json['process_id'];
    barcodeLink = json['barcode_link'];
    barcodeImg = json['barcode_img'];
    targetCost = json['target_cost'];
    cost = json['cost'];
    processDrawing = json['process_drawing'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    completed = json['completed'];
    woDate = json['wo_date'];
    vendorcode = json['vendorcode'] != null
        ? new Vendorcode.fromJson(json['vendorcode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sr_no'] = this.srNo;
    data['process_name'] = this.processName;
    data['process_id'] = this.processId;
    data['barcode_link'] = this.barcodeLink;
    data['barcode_img'] = this.barcodeImg;
    data['target_cost'] = this.targetCost;
    data['cost'] = this.cost;
    data['process_drawing'] = this.processDrawing;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['completed'] = this.completed;
    data['wo_date'] = this.woDate;
    if (this.vendorcode != null) {
      data['vendorcode'] = this.vendorcode.toJson();
    }
    return data;
  }
}

class Vendorcode {
  String vendorCode;
  String companyName;
  String processName;
  String machineName;
  double bedSizeX;
  double bedSizeY;
  double bedSizeZ;
  String gstNo;
  String bankAccountNo;
  String ifscCode;
  String nameOnCheck;
  String upiId;
  String billingAdd1;
  String billingAdd2;
  String city;
  String state;
  String country;
  int pin;
  String email;
  String contPersonName;
  int contPersonNumber;
  String latitude;
  String longitude;

  Vendorcode(
      {this.vendorCode,
      this.companyName,
      this.processName,
      this.machineName,
      this.bedSizeX,
      this.bedSizeY,
      this.bedSizeZ,
      this.gstNo,
      this.bankAccountNo,
      this.ifscCode,
      this.nameOnCheck,
      this.upiId,
      this.billingAdd1,
      this.billingAdd2,
      this.city,
      this.state,
      this.country,
      this.pin,
      this.email,
      this.contPersonName,
      this.contPersonNumber,
      this.latitude,
      this.longitude});

  Vendorcode.fromJson(Map<String, dynamic> json) {
    vendorCode = json['vendor_code'];
    companyName = json['company_name'];
    processName = json['process_name'];
    machineName = json['machine_name'];
    bedSizeX = json['bed_size_x'];
    bedSizeY = json['bed_size_y'];
    bedSizeZ = json['bed_size_z'];
    gstNo = json['gst_no'];
    bankAccountNo = json['bank_account_no'];
    ifscCode = json['ifsc_code'];
    nameOnCheck = json['name_on_check'];
    upiId = json['upi_id'];
    billingAdd1 = json['billing_add_1'];
    billingAdd2 = json['billing_add_2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pin = json['pin'];
    email = json['email'];
    contPersonName = json['cont_person_name'];
    contPersonNumber = json['cont_person_number'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_code'] = this.vendorCode;
    data['company_name'] = this.companyName;
    data['process_name'] = this.processName;
    data['machine_name'] = this.machineName;
    data['bed_size_x'] = this.bedSizeX;
    data['bed_size_y'] = this.bedSizeY;
    data['bed_size_z'] = this.bedSizeZ;
    data['gst_no'] = this.gstNo;
    data['bank_account_no'] = this.bankAccountNo;
    data['ifsc_code'] = this.ifscCode;
    data['name_on_check'] = this.nameOnCheck;
    data['upi_id'] = this.upiId;
    data['billing_add_1'] = this.billingAdd1;
    data['billing_add_2'] = this.billingAdd2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['pin'] = this.pin;
    data['email'] = this.email;
    data['cont_person_name'] = this.contPersonName;
    data['cont_person_number'] = this.contPersonNumber;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
