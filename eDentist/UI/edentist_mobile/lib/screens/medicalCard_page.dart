import 'package:edentist_mobile/models/dental_service.dart';
import 'package:edentist_mobile/models/medical_card.dart';
import 'package:edentist_mobile/models/user.dart';
import 'package:edentist_mobile/providers/dental_service_provider.dart';
import 'package:edentist_mobile/providers/medicalCard_provider.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MedicalCardPage extends StatefulWidget {
  final User user;

  MedicalCardPage({required this.user});

  @override
  _MedicalCardPageState createState() => _MedicalCardPageState();
}

class _MedicalCardPageState extends State<MedicalCardPage> {
  final MedicalCardProvider _medicalCardProvider = MedicalCardProvider();
  final DentalServiceProvider _dentalServiceProvider = DentalServiceProvider();
  final TextEditingController _searchController = TextEditingController();
  List<MedicalCard> medicalCards = [];
  List<DentalService> dentalServices = [];
  List<MedicalCard> filteredMedicalCards = [];
  bool isLoading = true;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    fetchMedicalRecords();
    fetchDentalServices();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> fetchMedicalRecords() async {
    try {
      var result = await _medicalCardProvider.get();
      setState(() {
        medicalCards = result.result;
        filteredMedicalCards = medicalCards;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchDentalServices() async {
    try {
      var result = await _dentalServiceProvider.get();
      setState(() {
        dentalServices = result.result;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onSearchChanged() {
    setState(() {
      searchQuery = _searchController.text.toLowerCase();
      filteredMedicalCards = medicalCards.where((medicalCard) {
        DentalService? matchingService = dentalServices.firstWhereOrNull(
            (service) => service.dentalServiceId == medicalCard.dentalServiceId);
        return matchingService?.serviceName?.toLowerCase().contains(searchQuery) ?? false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pregled kartona',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Pretraži po nazivu dijagnoze',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: filteredMedicalCards
                                .where((mc) => mc.userId == widget.user.userId)
                                .isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: filteredMedicalCards
                                .where((mc) => mc.userId == widget.user.userId)
                                .map((medicalCard) {
                              DentalService? matchingService =
                                  dentalServices.firstWhereOrNull((service) =>
                                      service.dentalServiceId ==
                                      medicalCard.dentalServiceId);
                              return _buildDiagnosis(
                                serviceName: matchingService?.serviceName ?? "",
                                date: medicalCard.datumDijagnoze.toString() ?? "",
                                doctorsOpinion: medicalCard.doctorsOppinion ?? "",
                              );
                            }).toList())
                        : Text("Nema dostupnih dijagnoza."),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildDiagnosis({
    required String serviceName,
    required String date,
    required String doctorsOpinion,
  }) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Datum: $date', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Naziv dijagnoze: $serviceName'),
            SizedBox(height: 8),
            Text('Mišljenje doktora: $doctorsOpinion'),
          ],
        ),
      ),
    );
  }
}
