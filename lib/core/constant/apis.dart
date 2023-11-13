class AutomationApi {
  static const baseUrl = "https://taosel.com/api";

  //**************** Authentication *******************//
  static const loginUrl = "$baseUrl/auth/login"; //post
  static const registerUrl = "$baseUrl/auth/register-client"; //post
  static const checkOtpRegisterUrl = "$baseUrl/auth/reset/check_code"; //post
  static const changePhoneUrl = "$baseUrl/change_phone"; //post
  static const countriesUrl = "$baseUrl/countries"; //get
  static const forgetUrl = "$baseUrl/auth/check-phone"; //post
  static const changePasswordUrl = "$baseUrl/auth/reset/reset_password"; //post
  static const updateAllProfileUrl = "$baseUrl/update_profile"; //post

  //**************** Profile *******************//
  static const profileUrl = "$baseUrl/profile"; //get
  static const updateNameUrl = "$baseUrl/update_name"; //post
  static const updateEmailUrl = "$baseUrl/update_email"; //post
  static const updatePhoneUrl = "$baseUrl/update_phone"; //post
  static const updateLicenseImageUrl = "$baseUrl/update_license_image"; //post

// ************** search car ****************//
  static const getRegionUrl = "$baseUrl/region";
  static const getAllGaragesUrl = "$baseUrl/garage";
  static const getCarsurl = "$baseUrl/cars";
  static const getListChangeCarsUrl = "$baseUrl/recieve_cars_list";
  static const changeCarUrl = "$baseUrl/change_car";
  static const getCarDetailsUrl = "$baseUrl/car";
  static const getOrderDataUrl = "$baseUrl/getOrderData";
  static const dropOfGetOrderDataUrl = "$baseUrl/ask_for_deliever";
  static const pickUpGetOrderDataUrl = "$baseUrl/ask_for_receive";
  static const addOrderUrl = "$baseUrl/addOrder";
  static const checkoutUrl = "$baseUrl/payment/checkout";

  // ************* Visa ***********************//
  static const addCreditCardUrl = "$baseUrl/addVisa";
  static const getCreditCardUrl = "$baseUrl/visa";
  static const deleteCreditCardUrl = "$baseUrl/deleteVisa";

  // ************** Orders *********************//
  static const getOrdersUrl = "$baseUrl/client_orders";
  static const recieve_deliever_orders = "$baseUrl/recieve_deliever_orders";
  static const cancelOrderUrl = "$baseUrl/cancelOrder";
  static const deleteOrderUrl = "$baseUrl/deleteOrder";
  static const contractUrl = "$baseUrl/previewContract";

  // ************* Scan QR ********************//
  static const scanQRUrl = "$baseUrl/getcarbyqr";
  static const checkImageCar = "$baseUrl/order/upload_image";
  static const openCarUrl = "$baseUrl/order/openCar";
  static const closeCarUrl = "$baseUrl/order/closeCar";
//********************PDF*******************
  static const PDF = "$baseUrl/previewContract/";
  static const DOWNLOADPDF = "$baseUrl/downloadContract/";
}
