import 'package:evently_app/Common%20Widget/custom_elevated_button.dart';
import 'package:evently_app/Common%20Widget/custom_text_field.dart';
import 'package:evently_app/Providers/app_location_provider.dart';
import 'package:evently_app/Tabs/Home%20Tab/Home%20widget/event_category.dart';
import 'package:evently_app/Add%20Event/event_time_or_date.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/location/location_picker.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_images.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;
  DateTime? selectedDate;
  String formatDate = "";
  TimeOfDay? selectedTime;
  String formatTime = "";
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    var locationProvider = Provider.of<AppLocationProvider>(context);
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> eventImagesList = [
      AppImages.sportImage,
      AppImages.birthdayImage,
      AppImages.meetingImage,
      AppImages.gamingImage,
      AppImages.workshopImage,
      AppImages.bookClubImage,
      AppImages.holidayImage,
      AppImages.eatingImage,
    ];
    List<IconData> iconsList = [
      Icons.sports_soccer,
      Icons.cake,
      Icons.meeting_room,
      Icons.sports_esports,
      Icons.work,
      Icons.menu_book,
      Icons.beach_access,
      Icons.dining,
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        title: Text(
          AppLocalizations.of(context)!.addEvent,
          style: AppStyles.bold20Primary,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.03,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: height * 0.02,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(eventImagesList[selectedIndex]),
                ),
                DefaultTabController(
                  length: eventsNameList.length,
                  child: TabBar(
                    isScrollable: true,
                    dividerColor: AppColors.transparentColor,
                    indicatorColor: AppColors.transparentColor,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.zero,
                    onTap: (value) {
                      selectedIndex = value;
                      setState(() {});
                    },
                    tabs: eventsNameList.map((event) {
                      return EventCategory(
                        borderColor: AppColors.primaryLight,
                        selectedBgColor: AppColors.primaryLight,
                        selectedIconColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        unSelectedIconColor: AppColors.primaryLight,
                        selectedTextStyle: Theme.of(
                          context,
                        ).textTheme.titleSmall!,
                        unSelectedTextStyle: AppStyles.bold16Primary,
                        isSelected:
                            selectedIndex == eventsNameList.indexOf(event),
                        eventName: event,
                        eventIcon: iconsList[eventsNameList.indexOf(event)],
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomTextFormField(
                  controller: titleController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  hintText: AppLocalizations.of(context)!.eventTitle,
                  prefixIcon: Icons.mode_edit_outlined,
                ),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                  hintText: AppLocalizations.of(context)!.eventDescription,
                  maxLines: 4,
                ),
                EventTimeOrDate(
                  onPressed: () {
                    chooseDate();
                  },
                  text: AppLocalizations.of(context)!.eventDate,
                  chooseDateOrTime: selectedDate != null
                      ? formatDate
                      : AppLocalizations.of(context)!.chooseDate,
                  icon: Icons.schedule,
                ),
                EventTimeOrDate(
                  onPressed: () {
                    chooseTime();
                  },
                  text: AppLocalizations.of(context)!.eventTime,
                  chooseDateOrTime: selectedTime != null
                      ? formatTime
                      : AppLocalizations.of(context)!.chooseTime,
                  icon: Icons.calendar_month,
                ),
                CustomElevatedButton(
                  borderColor: AppColors.primaryLight,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  text:
                      locationProvider.eventAddress ??
                      AppLocalizations.of(context)!.chooseEventLocation,
                  textStyle: AppStyles.medium16Primary,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.locationPicker);
                  },
                  hasIcon: true,
                  icon: Image.asset(AppImages.eventLocationIcon),
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryLight,
                  ),
                ),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.addEvent,
                  onPressed: () {
                    addEvent();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    if (selectedDate != null) {
      formatDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
    }
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    if (selectedTime != null) {
      formatTime = selectedTime!.format(context);
    }
    setState(() {});
  }

  void addEvent() {
    formKey.currentState!.validate();
  }
}
