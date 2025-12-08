import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({super.key});

  @override
  State<GoogleMapsWidget> createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  /// Haritada gösterilecek marker'ların listesi
  final Set<Marker> _markers = <Marker>{};

  @override
  void initState() {
    super.initState();
    // Başlangıç marker'ları
    //dummy data
    addMarker(const LatLng(41.0082, 28.9784));
    addMarker(const LatLng(41.01, 28.97));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      /// Haritanın başlangıç kamera konumu ve görünüm ayarları
      initialCameraPosition: const CameraPosition(
        /// Haritanın başlangıçta gösterileceği koordinat (İstanbul)
        target: LatLng(41.0082, 28.9784),

        /// Haritanın yakınlaştırma seviyesi (0-20 arası, 12 orta seviye)
        zoom: 12.0,
      ),

      markers: _markers,
      onTap: (LatLng pos) {
        addMarker(pos);
      },

      /// Kullanıcının mevcut konumunu haritada mavi nokta olarak gösterir
      myLocationEnabled: true,

      /// Sağ üst köşede kullanıcıyı kendi konumuna götüren butonu gösterir
      myLocationButtonEnabled: true,

      /// Haritanın sağ tarafındaki yakınlaştırma/uzaklaştırma kontrollerini gizler
      zoomControlsEnabled: true,

      /// Harita tipi: normal (standart harita görünümü)
      mapType: MapType.normal,

      /// Haritanın üst kısmında pusula göstergesini gösterir
      compassEnabled: true,
    );
  }

  void addMarker(LatLng position) {
    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    setState(() {
      _markers.add(Marker(markerId: MarkerId(id), position: position));
    });
  }
}
