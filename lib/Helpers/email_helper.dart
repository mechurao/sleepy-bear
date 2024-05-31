import 'package:email_launcher/email_launcher.dart';

abstract class EmailHelper{
  static const String _contactEmail = "mechurao1998@gmail.com";
  static const String _subject = "Question about Sleepy Bear";

  static Future<void> openContactEmail() async{
    Email email = Email(
      to: [_contactEmail],
      subject: _subject
    );
    await EmailLauncher.launch(email);
  }
}