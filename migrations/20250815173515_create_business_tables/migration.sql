-- CreateTable
CREATE TABLE "public"."patient" (
    "id" TEXT NOT NULL,
    "document_type" TEXT NOT NULL,
    "document_number" TEXT NOT NULL,
    "first_name" TEXT,
    "last_name" TEXT,
    "birth_date" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."provider" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "license_number" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "provider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."encounter" (
    "id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "provider_id" TEXT,
    "billing_mode" TEXT NOT NULL,
    "start_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_at" TIMESTAMP(3),
    "type" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "encounter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."clinical_note" (
    "id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "author_id" TEXT NOT NULL,
    "note_type" TEXT NOT NULL,
    "body" TEXT,
    "primary_cie10_code" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "clinical_note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."procedure" (
    "id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "cups_code" TEXT NOT NULL,
    "performed_at" TIMESTAMP(3),
    "quantity" DECIMAL(65,30),
    "notes" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "procedure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."code_cie10" (
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "sexo_aplica" TEXT,
    "edad_min" INTEGER,
    "edad_max" INTEGER,
    "capitulo" TEXT,
    "grupo" TEXT,
    "subgrupo" TEXT,
    "categoria" TEXT,
    "habilitado" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "code_cie10_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "public"."code_cups" (
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "code_cups_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "public"."code_atc" (
    "code" TEXT NOT NULL,
    "name" TEXT,
    "level" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "code_atc_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "public"."drug_code" (
    "code" TEXT NOT NULL,
    "display_name" TEXT NOT NULL,
    "form" TEXT,
    "route" TEXT,
    "strength" TEXT,
    "actives" TEXT,
    "atc_code" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "drug_code_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "public"."prescription" (
    "id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "issuer_id" TEXT NOT NULL,
    "issued_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "prescription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."prescription_item" (
    "id" TEXT NOT NULL,
    "prescription_id" TEXT NOT NULL,
    "drug_code" TEXT,
    "free_text" TEXT,
    "dose_amount" DECIMAL(65,30),
    "dose_unit" TEXT,
    "route" TEXT,
    "frequency" TEXT,
    "duration" TEXT,
    "qty" DECIMAL(65,30),
    "allow_generic_sub" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "prescription_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_batch" (
    "id" TEXT NOT NULL,
    "provider_code" TEXT NOT NULL,
    "payer_name" TEXT,
    "period_start" TIMESTAMP(3) NOT NULL,
    "period_end" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'abierto',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_batch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_batch_item" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_batch_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_us" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "doc_type" TEXT NOT NULL,
    "doc_number" TEXT NOT NULL,
    "eps_code" TEXT,
    "regimen" TEXT,
    "municipality" TEXT,
    "zone" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_us_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_af" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "provider_code" TEXT NOT NULL,
    "patient_doc_type" TEXT NOT NULL,
    "patient_doc_num" TEXT NOT NULL,
    "issue_date" TIMESTAMP(3) NOT NULL,
    "total" DECIMAL(65,30) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_af_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_ac" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "service_date" TIMESTAMP(3) NOT NULL,
    "finalidad" TEXT,
    "causa_externa" TEXT,
    "dx_principal" TEXT,
    "dx_rel1" TEXT,
    "dx_rel2" TEXT,
    "tipo_dx_principal" TEXT,
    "valor_consulta" DECIMAL(65,30) NOT NULL,
    "valor_cuota" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "neto_pagar" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_ac_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_ap" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "procedure_date" TIMESTAMP(3) NOT NULL,
    "ambito" TEXT,
    "finalidad" TEXT,
    "personal_atiende" TEXT,
    "cups_code" TEXT,
    "dx_principal" TEXT,
    "dx_rel1" TEXT,
    "complicacion" TEXT,
    "forma_realizacion" TEXT,
    "valor_procedimiento" DECIMAL(65,30) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_ap_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_am" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "drug_code" TEXT,
    "drug_name" TEXT NOT NULL,
    "form" TEXT,
    "route" TEXT,
    "atc_code" TEXT,
    "dose" DECIMAL(65,30),
    "dose_unit" TEXT,
    "frequency" TEXT,
    "duration" TEXT,
    "quantity" DECIMAL(65,30) NOT NULL,
    "unit_price" DECIMAL(65,30) NOT NULL,
    "total_price" DECIMAL(65,30) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_am_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_ah" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "admit_at" TIMESTAMP(3) NOT NULL,
    "discharge_at" TIMESTAMP(3),
    "dx_ingreso" TEXT,
    "dx_egreso_principal" TEXT,
    "dx_egreso_rel1" TEXT,
    "dx_egreso_rel2" TEXT,
    "condicion_egreso" TEXT,
    "causa_muerte" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_ah_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_au" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "admit_at" TIMESTAMP(3) NOT NULL,
    "leave_at" TIMESTAMP(3),
    "dx_principal" TEXT,
    "dx_rel1" TEXT,
    "destino_egreso" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_au_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."rips_at" (
    "id" TEXT NOT NULL,
    "batch_id" TEXT NOT NULL,
    "encounter_id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "service_code" TEXT NOT NULL,
    "service_name" TEXT NOT NULL,
    "quantity" DECIMAL(65,30) NOT NULL,
    "unit_price" DECIMAL(65,30) NOT NULL,
    "total_price" DECIMAL(65,30) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rips_at_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "patient_document_type_document_number_key" ON "public"."patient"("document_type", "document_number");

-- CreateIndex
CREATE UNIQUE INDEX "rips_batch_item_batch_id_encounter_id_key" ON "public"."rips_batch_item"("batch_id", "encounter_id");

-- CreateIndex
CREATE UNIQUE INDEX "rips_us_batch_id_patient_id_key" ON "public"."rips_us"("batch_id", "patient_id");

-- CreateIndex
CREATE UNIQUE INDEX "rips_af_batch_id_invoice_number_key" ON "public"."rips_af"("batch_id", "invoice_number");

-- AddForeignKey
ALTER TABLE "public"."encounter" ADD CONSTRAINT "encounter_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."encounter" ADD CONSTRAINT "encounter_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "public"."provider"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."clinical_note" ADD CONSTRAINT "clinical_note_primary_cie10_code_fkey" FOREIGN KEY ("primary_cie10_code") REFERENCES "public"."code_cie10"("code") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."clinical_note" ADD CONSTRAINT "clinical_note_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."clinical_note" ADD CONSTRAINT "clinical_note_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "public"."provider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."procedure" ADD CONSTRAINT "procedure_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."procedure" ADD CONSTRAINT "procedure_cups_code_fkey" FOREIGN KEY ("cups_code") REFERENCES "public"."code_cups"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."drug_code" ADD CONSTRAINT "drug_code_atc_code_fkey" FOREIGN KEY ("atc_code") REFERENCES "public"."code_atc"("code") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."prescription" ADD CONSTRAINT "prescription_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."prescription" ADD CONSTRAINT "prescription_issuer_id_fkey" FOREIGN KEY ("issuer_id") REFERENCES "public"."provider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."prescription_item" ADD CONSTRAINT "prescription_item_prescription_id_fkey" FOREIGN KEY ("prescription_id") REFERENCES "public"."prescription"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."prescription_item" ADD CONSTRAINT "prescription_item_drug_code_fkey" FOREIGN KEY ("drug_code") REFERENCES "public"."drug_code"("code") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_batch_item" ADD CONSTRAINT "rips_batch_item_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_batch_item" ADD CONSTRAINT "rips_batch_item_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_us" ADD CONSTRAINT "rips_us_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_us" ADD CONSTRAINT "rips_us_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_af" ADD CONSTRAINT "rips_af_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ac" ADD CONSTRAINT "rips_ac_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ac" ADD CONSTRAINT "rips_ac_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ac" ADD CONSTRAINT "rips_ac_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ap" ADD CONSTRAINT "rips_ap_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ap" ADD CONSTRAINT "rips_ap_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ap" ADD CONSTRAINT "rips_ap_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_am" ADD CONSTRAINT "rips_am_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_am" ADD CONSTRAINT "rips_am_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_am" ADD CONSTRAINT "rips_am_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ah" ADD CONSTRAINT "rips_ah_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ah" ADD CONSTRAINT "rips_ah_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_ah" ADD CONSTRAINT "rips_ah_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_au" ADD CONSTRAINT "rips_au_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_au" ADD CONSTRAINT "rips_au_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_au" ADD CONSTRAINT "rips_au_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_at" ADD CONSTRAINT "rips_at_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "public"."rips_batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_at" ADD CONSTRAINT "rips_at_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "public"."encounter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."rips_at" ADD CONSTRAINT "rips_at_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "public"."patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
