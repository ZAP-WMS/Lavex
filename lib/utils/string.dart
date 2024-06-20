import 'package:flutter/material.dart';

String welcomeText = 'Welcome Back!';
String loginText = 'Login to continue';
String forgetText = 'Forget Password?';
String newUser = 'New User? ';
String signUp = 'Sign Up';
String settingText = 'Setting';
String adminProfileText = 'AdminProfile';
String logoutText = 'Logout';

// create invoice
String clientTxt = 'Client:';
String addressTxt = 'Address:';
String formaTxt = 'Pro-forma No:';
String individualTxt = 'Individual:';
String cityTxt = 'city:';
String increaseFormaTxt = 'Increase';
String shortCodeTxt = 'ShortCode';
String stateTxt = 'State';
String dateTxt = 'Invoice date';
String gstregistrationTxt = 'GSTRegistration';
String toShipedTxt = 'To Shipped';
String stateCodeTxt = 'State Code';
String dueDateTxt = 'Due Date';
String forToShipped = 'For to Shipped';
String countryTxt = 'Country:';
String poTxt = 'PO No';
String selectedCurrencyTxt = 'Selected currency:';
String deliveryChallanTxt = 'Delivery Challan';
String indicatingMaturityTxt = 'Indicate a maturity date:';
String accountingTxt = 'Cash accounting';
String itemTxt = 'Item';
String brandTxt = 'Brand';
String quantityTxt = 'Quantity';
String gstTxt = 'Gst';
String priceTxt = 'Price';
String totalTxt = 'Total';
String invoiceAmountTxt = 'Invoice amount';
String discountTxt = 'Discount';
String taxIncludeTxt = 'Tax Include';
String grandTotalTxt = 'Grand Total';
String remarkTxt = 'Remarks';
String paymentMethodTxt = 'Payment Method';
String betrayedTxt = 'Betrayed';
String acceptedTxt = 'Accepted';
String selectTxt = 'Select';
// Invoice
String invoiceTxt = 'invoice';

//create invoice Button Name
String createTxt = 'Create Incvoice';

// Cash Inward Entry
String cashInwardTxt = 'Cash Inward Entry';

// Cash Inward Entry
String createProductionTxt = 'Create Production Entry';

// Cash Inward Entry
String createInwardTxt = 'Create Inward Entry';

// My Invoice List
String invoiceNoTxt = 'Invoice num';
String paymentTypeTxt = 'Payment Type:';
String amountFromTxt = 'Amount From:';
String dateCreateFromTxt = 'Date Create From';
String toTxt = 'To';

//tab text
String addItemTxt = 'Add Item';
String manufacturerTxt = 'Manufacturer';
String brandsTxt = 'Brands';
String deleteTxt = 'Delete';
String exportDataTxt = 'Export Data';

// cash Inward
String forUnitTxt = 'For Unit';
String accountablePerson = 'Accountable Person';
String cashMovementNo = 'Cash Movement No';
String supplierName = "Supplier's Name";
String supplierInvoiceNo = 'Supplier Invoice No';
String movementAmountTxt = 'Movement amount';

// Add Item
String itemCodeTxt = 'Item_code';
String storeTxt = 'Store';
String manufactureTxt = 'Manufacturer';
String quantityTypeTxt = 'Quantity Type';
String lawquantityTypeTxt = 'Law Quantity';
String categoryTypeTxt = 'Category';
String stockStatusTxt = 'Stock Status';
String currencyTxt = 'Currency';
String statusTxt = 'Status';

final List<String> tabTitles = [
  'Home',
  'Create Invoice',
  'My Invoice',
  'My Payment',
  //'Cash Memo Payments',
  'Supplier Payment',
  "My Client's",
  "Client's Ledger Balance",
  'My Supplier',
  'Supplier Ledger Balance',
  'Bill Of Material',
  'Item Master',
  'Store',
 // 'Protocols',
  'Reports',
  'Low Quantity',
//  'All Cash Payment',
//  'Received Cash Payment',
  'Logs',
];

//final menubar Icon
final List<String> menubarIcons = [
  'assets/menu_bar/home.png',
  'assets/menu_bar/create_invoice.png',
  'assets/menu_bar/invoice.png',
  'assets/menu_bar/my_payment.png',
//  'assets/menu_bar/cash_memo.png',
  'assets/menu_bar/supplier_payment.png',
  'assets/menu_bar/my_client.png',
  'assets/menu_bar/clients ledger balance.png',
  'assets/menu_bar/my Supplier.png',
  'assets/menu_bar/Supplier ledger balance.png',
  'assets/menu_bar/bom.png',
  'assets/menu_bar/item master.png',
  'assets/menu_bar/store.png',
 // 'assets/menu_bar/protocols.png',
  'assets/menu_bar/Reports.png',
  'assets/menu_bar/low quantity.png',
 // 'assets/menu_bar/cash payment.png',
 // 'assets/menu_bar/Received cash payment.png',
  'assets/menu_bar/logs.png',
];

final List<String> invoicesubTitles = [
  'Create Invoice',
  'My Invoice',
  'Purchase Invoice',
];

final List<String> paymentssubTitles = [
  'My Payment',
  'Cash Memo Payments',
  'Suppllier Payment',
];

final List<IconData> navbaTabIcons = [
  Icons.home_filled,
  Icons.create_new_folder,
  Icons.my_library_add,
  Icons.shopping_cart_checkout_sharp,
  Icons.create_new_folder,
  Icons.my_library_add,
  Icons.home_max_outlined,
  Icons.create_new_folder,
  Icons.my_library_add,
  Icons.home_max_outlined,
  Icons.create_new_folder,
  Icons.my_library_add,
  Icons.home_max_outlined,
  Icons.create_new_folder,
  Icons.my_library_add,
  Icons.home_max_outlined,
  Icons.create_new_folder,
  Icons.my_library_add,
];

// List of tab titles

final List<String> createInvoice = [
  // 'Invoice Setting',
  'Pro-forma',
  'Invoice',
  'Debit note',
  'Credit note',
  'Delievery Challan',
  // 'Cash Memo'
];

// my invoice payments
final List<String> paymentsList = [
  'Paid',
  'Unpaid',
  'Partialy Paid',
];

// my status List
final List<String> statusList = [
  'Issued',
  'Sended',
  'Refused',
  'Acceptd',
  'Canceled',
  'Draft',
];

final List<String> myInvoiceTabTitle = [
  'Pro-forma',
  'Invoice',
  'Debit note',
  'Credit note',
  'Delievery Challan',
  // 'Cash Memo',
  'My Invoice List',
  'Delete Invoice'
];

final List<IconData> myInvoiceTabIcons = [
  Icons.home_max_outlined,
  Icons.business_center_outlined,
  Icons.account_circle_outlined,
];
//my Invoice table name
final List<String> myInvoiceTableName = [
  'Number',
  'Date',
  'Client Name',
  'Type',
  'Status',
  'W/O GST',
  'Total(with GST)',
  'Options',
];

// my payment list
final List<String> myPayment = [
  'Payment Number',
  'Number',
  'Date',
  'Client Name',
  'Invoice Amount',
  'Payment Amount',
  'Payment Method',
  'Payment Cheque',
  'Cheque Date',
  'Options'
];

// Bom list
final List<String> bomTableTitle = [
  'Name',
  'Store',
  'Status',
  'Manage',
];

// my supplier list
final List<String> supplierPayments = [
  'Movement Number',
  'Number',
  'Date',
  'Supplier Name',
  'Invoice Amount',
  'Payment Amount',
  'Payment Method',
  'Payment Cheque',
  'Cheque Date',
  'Options'
];

// client
final List<String> myClientTableName = [
  'Name',
  'ShortCode',
  'Client Short-Code',
  'Mobile Number',
  'Area',
  'Location',
  'Manage',
];

// Stock Page
final List<String> stockTableName = [
  'Store',
  'Item',
  'Quantity',
];
// Item Master
final List<String> itemMasterTableName = [
  'Id',
  'Name',
  'Item_Code',
  'Available Quantity',
  'Law Quantity',
  'Quantity Type',
  'Price',
  'GST',
  'Stock Status',
  'Store',
  'Category',
  'Total Price',
  'Status',
  'Manage',
];

final List<String> itemMasterTabName = [
  'Add Item',
  'Manufacturer',
  'Brands',
  'Delete',
  'Export Data'
];

final List<String> storeTabName = [
  'Cash Inward Entry',
  'Inward Entry',
  'Add New Production',
  'Stocks',
  'Cancelled Stock list',
  'Stock Received',
  'Stock Pending',
  'Cancel',
  'All Inward Entry',
  'All Production Entry',
  'All Movement Entry',
  'All Cash Inward Entry',
  'All DC Entry',
  'Store Setting',
];
