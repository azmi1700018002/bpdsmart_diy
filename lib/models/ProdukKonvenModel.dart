// To parse this JSON data, do
//
//     final produkKonvenModel = produkKonvenModelFromJson(jsonString);

import 'dart:convert';

List<ProdukKonvenModel> produkKonvenModelFromJson(String str) =>
    List<ProdukKonvenModel>.from(
        json.decode(str).map((x) => ProdukKonvenModel.fromJson(x)));

String produkKonvenModelToJson(List<ProdukKonvenModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProdukKonvenModel {
  ProdukKonvenModel({
    required this.kontenId,
    required this.kontenParent,
    this.kontenUrut,
    required this.kategoriId,
    this.kontenSimulasi,
    this.kontenSukuBunga,
    required this.kontenMenu,
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
    required this.kontenUrl,
    this.filePath,
    required this.kategoriNama,
  });

  String kontenId;
  String kontenParent;
  dynamic kontenUrut;
  String kategoriId;
  dynamic kontenSimulasi;
  dynamic kontenSukuBunga;
  String kontenMenu;
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
  String kontenUrl;
  dynamic filePath;
  String kategoriNama;

  factory ProdukKonvenModel.fromJson(Map<String, dynamic> json) =>
      ProdukKonvenModel(
        kontenId: json["konten_id"],
        kontenParent: json["konten_parent"],
        kontenUrut: json["konten_urut"],
        kategoriId: json["kategori_id"],
        kontenSimulasi: json["konten_simulasi"],
        kontenSukuBunga: json["konten_suku_bunga"],
        kontenMenu: json["konten_menu"],
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
        kontenUrl: json["konten_url"],
        filePath: json["file_path"],
        kategoriNama: json["kategori_nama"],
      );

  Map<String, dynamic> toJson() => {
        "konten_id": kontenId,
        "konten_parent": kontenParent,
        "konten_urut": kontenUrut,
        "kategori_id": kategoriId,
        "konten_simulasi": kontenSimulasi,
        "konten_suku_bunga": kontenSukuBunga,
        "konten_menu": kontenMenu,
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
        "konten_url": kontenUrl,
        "file_path": filePath,
        "kategori_nama": kategoriNama,
      };
}
