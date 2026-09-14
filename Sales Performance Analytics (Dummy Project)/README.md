# 📊 End-to-End Sales & Profitability Performance Analytics

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Python](https://img.shields.io/badge/Python-3.10%2B-green)
![Data Visualization](https://img.shields.io/badge/Dashboard-Looker%20Studio-orange)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

## 📌 Project Overview

Proyek ini merupakan analisis kinerja penjualan dan profitabilitas ritel e-commerce secara _end-to-end_. Proyek ini bertujuan untuk membantu tim manajemen dan operasional memahami tren pendapatan bulanan, efisiensi modal (HPP), kontribusi segmen pelanggan, serta mengevaluasi efektivitas skema diskon terhadap laba kotor (_Gross Profit_).

Analisis ini menggunakan dataset dummy yang diolah melalui pipeline _database_ relasional, pembersihan data berbasis Python, kueri analitis SQL tingkat lanjut, hingga visualisasi interaktif.

---

## 🎯 Business Objectives

1. **Mengukur Performa Finansial Bulanan:** Menganalisis tren _Net Revenue_, _COGS_, dan _Gross Profit Margin (%)_ sepanjang tahun 2025.
2. **Segmentasi Pelanggan & Produk:** Mengidentifikasi kategori produk _Top Performing_ serta segmen pelanggan yang memberikan kontribusi _Average Order Value_ (AOV) tertinggi.
3. **Evaluasi Dampak Promosi:** Menganalisis korelasi antara persentase diskon terhadap volume penjualan dan erosi margin keuntungan.

---

## 🛠️ Tech Stack & Tools

- **Database Engine:** MySQL (Schema Definition, DDL, DML, Window Functions, CTE).
- **Programming & Data Science:** Python 3.x (`Pandas`, `NumPy`, `Matplotlib`, `Seaborn`).
- **Data Visualization:** Google Looker Studio / Power BI.
- **Version Control:** Git & GitHub.

---

## 📁 Repository Structure

```text
sales-performance-analytics/
│
├── data/
│   └── master_sales_dataset.csv       # Flat dataset hasil ekspor 4-way JOIN SQL
│
├── sql/
│   ├── 01_schema_definition.sql       # DDL: Tabel Database & Constraint (PK/FK)
│   ├── 02_data_ingestion.sql          # DML: Skrip sampel & instruksi pengimporan data
│   └── 03_business_queries.sql        # Kueri KPI Finansial, Ranking, & Master View
│
├── python/
│   └── data_cleansing_and_eda.ipynb# Notebook pembersihan & visualisasi data
│
├── dashboard/
│   └── dashboard_preview.png          # Tangkapan layar dashboard interaktif
│
└── README.md                          # Dokumentasi utama proyek
```

## 💡 Key Business Insights

Kategori Electronics vs. Apparel:

Kategori Electronics menjadi penyumbang omzet (Net Revenue) terbesar (60% dari total omzet).

Namun, kategori Apparel menghasilkan Gross Profit Margin (%) tertinggi (35%) karena rasio biaya modal (COGS) yang jauh lebih rendah.

Evaluasi Sensitivitas Diskon:

Hasil analisis korelasi menunjukkan bahwa pemberian diskon di atas 10% pada kategori Furniture tidak meningkatkan volume pembelian unit secara signifikan, tetapi menggerus margin laba kotor hingga 12%.

Perilaku Pembelian Segmen Pelanggan:

Segmen Corporate memiliki Average Order Value (AOV) tertinggi dibandingkan segmen Consumer dan Home Office, dengan kecenderungan bertransaksi pada pertengahan bulan.

## 📈 Strategic Recommendations
Optimasi Strategi Promo: Hentikan diskon langsung (flat discount) di atas 10% untuk produk berkategori Furniture. Dialihkan menggunakan skema bundling produk (misal: beli meja gratis aksesori) untuk mempertahankan margin kotor.

Pengelolaan Inventaris: Prioritaskan ketersediaan stok (stock-keeping) untuk 5 produk teratas (Top 5 Products) guna mencegah kerugian potensi omzet (out-of-stock) pada periode puncak penjualan bulanan.

Fokus Penjualan B2B: Tingkatkan alokasi tim pemasaran untuk menggarap segmen Corporate mengingat nilai AOV yang signifikan lebih besar.

## 🚀 How to Run This Project
Database Setup (SQL):

Jalankan file sql/01_schema_definition.sql di MySQL Workbench / Terminal untuk membuat struktur basis data.

Impor data dari folder data/ atau gunakan file sql/02_data_ingestion.sql.

Eksekusi kueri analitis di sql/03_business_queries.sql untuk mendapatkan agregasi data bisnis.

Python Environment Setup:

Install pustaka yang dibutuhkan:

Buka dan jalankan Jupyter Notebook pada python/02_data_cleansing_and_eda.ipynb.

👤 Author
Nama: [Nama Lengkap Anda]

Peran: Data Analyst / IT Engineer

LinkedIn: [Link Profil LinkedIn Anda]

Portfolio / Email: [Email Kontak Anda]
