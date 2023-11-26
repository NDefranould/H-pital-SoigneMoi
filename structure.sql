BENGIN;

Utilisateur (ID, Nom, Prénom, Adresse postale, Email, Mot de passe)

CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "firstname" TEXT NOT NULL,
    "address" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);

Médecin (ID, Nom, Prénom, Spécialité, Matricule, IDspécialitée)

CREATE TABLE IF NOT EXISTS "doctors" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "firstname" TEXT NOT NULL UNIQUE,
    "speciality" TEXT NOT NULL UNIQUE,
    "registration" INTEGER GENERATED,
    "speciality_id" INTEGER NOT NULL REFERENCES specialities(id),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);

Specialitée (ID, Nom de la Spécialité)

CREATE TABLE IF NOT EXISTS "specialities" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);

Séjour (ID, Date de début, Date de fin, Motif, Spécialiste Nécessaire, IDutilisateur, IDmedécin)

CREATE TABLE IF NOT EXISTS "stays" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "date_of_begin" DATE NOT NULL,
    "date_of_end" DATE NOT NULL,
    "pattern" TEXT NOT NULL UNIQUE,
    "speciality" TEXT NOT NULL UNIQUE,
    "user_id" INTEGER NOT NULL REFERENCES users(id),
    "doctor_id" INTEGER NOT NULL REFERENCES doctors(id),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);


Avis (ID, Libellé, Date, Description, IDséjour)

CREATE TABLE IF NOT EXISTS "notice" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "wording" TEXT NOT NULL UNIQUE,
    "date" DATE NOT NULL,
    "description" TEXT NOT NULL,
    "stays_id" INTEGER NOT NULL REFERENCES stays(id),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);
Prescription (ID, commentaire, date de prescription, IDSéjour)

CREATE TABLE IF NOT EXISTS "prescriptions" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "comment" TEXT NOT NULL UNIQUE,
    "date_of_prescription" DATE NOT NULL,
    "stays_id" INTEGER NOT NULL REFERENCES stays(id),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);

médicaments (ID, nom)

CREATE TABLE IF NOT EXISTS "medicine" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);

Détaille_prescription: IDmédicaments, IDprescription, posologie, date de début, date de fin

CREATE TABLE IF NOT EXISTS "detailed_prescription" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "medicine_id" INTEGER NOT NULL REFERENCES medecine(id),
    "prescriptions_id" INTEGER NOT NULL REFERENCES prescriptions(id),
    "dosage" TEXT NOT NULL,
    "date_of_begin" DATE NOT NULL,
    "date_of_end" DATE NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 
);





CREATE TABLE IF NOT EXISTS "roles" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ 

);

INSERT INTO "roles" (name) VALUES 
    ('users'), 
    ('doctors');