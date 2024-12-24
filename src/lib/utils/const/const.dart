// App-wide constants
const String kAppName = 'Doctor Apps';
const String kAppVersion = '1.0.0';

// Validation constants
const int kMinPatientNameLength = 2;
const int kMaxPatientNameLength = 50;
const int kMinPatientAge = 0;
const int kMaxPatientAge = 150;
const int kPhoneNumberLength = 10;

// Error messages
const String kErrorGeneric = 'An unexpected error occurred. Please try again.';
const String kErrorConnection =
    'Unable to connect to the server. Please check your internet connection.';
const String kErrorInvalidName =
    'Please enter a valid name between 2 and 50 characters.';
const String kErrorInvalidAge = 'Please enter a valid age between 0 and 150.';
const String kErrorInvalidPhone = 'Please enter a valid 10-digit phone number.';
const String kErrorInvalidGender = 'Please select a gender.';
const String kErrorLoadingPatients =
    'Unable to load patients. Please try again.';
const String kErrorSavingPatient =
    'Unable to save patient information. Please try again.';
const String kErrorDeletingPatient =
    'Unable to delete patient. Please try again.';

// Success messages
const String kSuccessSavePatient = 'Patient information saved successfully.';
const String kSuccessDeletePatient = 'Patient deleted successfully.';

// Labels
const String kLabelName = 'Full Name';
const String kLabelAge = 'Age';
const String kLabelGender = 'Gender';
const String kLabelPhone = 'Phone Number';
const String kLabelAddress = 'Address';
const String kLabelMedicalHistory = 'Medical History';

// Buttons
const String kButtonSave = 'Save';
const String kButtonDelete = 'Delete';
const String kButtonCancel = 'Cancel';
const String kButtonConfirm = 'Confirm';
