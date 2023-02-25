CREATE TABLE "customer" (
  "id" bigserial PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "phone" varchar,
  "created_at" timestamptz DEFAULT (now())
);

CREATE INDEX ON "customer" ("first_name");

CREATE INDEX ON "customer" ("last_name");

CREATE INDEX ON "customer" ("email");

CREATE INDEX ON "customer" ("phone");
