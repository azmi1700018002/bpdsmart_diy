// To parse this JSON data, do
//
//     final danaKonven = danaKonvenFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

List<DanaKonven> danaKonvenFromJson(String str) =>
    List<DanaKonven>.from(json.decode(str).map((x) => DanaKonven.fromJson(x)));

String danaKonvenToJson(List<DanaKonven> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DanaKonven {
  DanaKonven({
    this.kontenId,
    this.kontenParent,
    this.kontenUrut,
    this.kategoriId,
    this.kontenSimulasi,
    this.kontenSukuBunga,
    this.kontenMenu,
    this.kontenJudul,
    this.kontenSubjudul,
    this.kontenGambar,
    this.kontenGambar2,
    this.kontenGambar3,
    this.kontenDeskripsi,
    this.kontenSyarat,
    this.kontenKetentuan,
    this.kontenFasilitas,
    this.kontenPromosiGambar,
    this.kontenPromosiText,
    this.kontenSk,
    this.kontenStatus,
    this.kontenUpdate,
    this.kontenApproval,
    this.kontenUrl,
    this.filePath,
    this.kategoriNama,
  });

  String? kontenId;
  String? kontenParent;
  dynamic kontenUrut;
  String? kategoriId;
  dynamic kontenSimulasi;
  dynamic kontenSukuBunga;
  String? kontenMenu;
  dynamic kontenJudul;
  dynamic kontenSubjudul;
  dynamic kontenGambar;
  dynamic kontenGambar2;
  dynamic kontenGambar3;
  dynamic kontenDeskripsi;
  dynamic kontenSyarat;
  dynamic kontenKetentuan;
  dynamic kontenFasilitas;
  dynamic kontenPromosiGambar;
  dynamic kontenPromosiText;
  dynamic kontenSk;
  dynamic kontenStatus;
  dynamic kontenUpdate;
  dynamic kontenApproval;
  String? kontenUrl;
  dynamic filePath;
  String? kategoriNama;

  factory DanaKonven.fromJson(Map<String, dynamic> json) => DanaKonven(
        kontenId: json["konten_id"] ?? null,
        kontenParent: json["konten_parent"] ?? null,
        kontenUrut: json["konten_urut"],
        kategoriId: json["kategori_id"] ?? null,
        kontenSimulasi: json["konten_simulasi"],
        kontenSukuBunga: json["konten_suku_bunga"],
        kontenMenu: json["konten_menu"] ?? null,
        kontenJudul: json["konten_judul"],
        kontenSubjudul: json["konten_subjudul"],
        kontenGambar: json["konten_gambar"],
        kontenGambar2: json["konten_gambar2"],
        kontenGambar3: json["konten_gambar3"],
        kontenDeskripsi: json["konten_deskripsi"],
        kontenSyarat: json["konten_syarat"],
        kontenKetentuan: json["konten_ketentuan"],
        kontenFasilitas: json["konten_fasilitas"],
        kontenPromosiGambar: json["konten_promosi_gambar"],
        kontenPromosiText: json["konten_promosi_text"],
        kontenSk: json["konten_sk"],
        kontenStatus: json["konten_status"],
        kontenUpdate: json["konten_update"],
        kontenApproval: json["konten_approval"],
        kontenUrl: json["konten_url"] ?? null,
        filePath: json["file_path"],
        kategoriNama: json["kategori_nama"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "konten_id": kontenId ?? null,
        "konten_parent": kontenParent ?? null,
        "konten_urut": kontenUrut,
        "kategori_id": kategoriId ?? null,
        "konten_simulasi": kontenSimulasi,
        "konten_suku_bunga": kontenSukuBunga,
        "konten_menu": kontenMenu ?? null,
        "konten_judul": kontenJudul,
        "konten_subjudul": kontenSubjudul,
        "konten_gambar": kontenGambar,
        "konten_gambar2": kontenGambar2,
        "konten_gambar3": kontenGambar3,
        "konten_deskripsi": kontenDeskripsi,
        "konten_syarat": kontenSyarat,
        "konten_ketentuan": kontenKetentuan,
        "konten_fasilitas": kontenFasilitas,
        "konten_promosi_gambar": kontenPromosiGambar,
        "konten_promosi_text": kontenPromosiText,
        "konten_sk": kontenSk,
        "konten_status": kontenStatus,
        "konten_update": kontenUpdate,
        "konten_approval": kontenApproval,
        "konten_url": kontenUrl ?? null,
        "file_path": filePath,
        "kategori_nama": kategoriNama ?? null,
      };
}
