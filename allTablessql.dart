//All sql codes for tables are below
String accountTableSQL = '''
CREATE TABLE account (
    email TEXT PRIMARY KEY,
    password TEXT NOT NULL,
    username TEXT NOT NULL,
    profile_picture TEXT,
    role TEXT NOT NULL 
);
''';

String weddingOwnerTableSQL = '''
CREATE TABLE wedding_owner (
    email TEXT PRIMARY KEY,
    wedding_date TEXT, 
    FOREIGN KEY (email) REFERENCES account (email)
);
''';

String guestTableSQL = '''
CREATE TABLE guest (
    guest_id INTEGER PRIMARY KEY AUTOINCREMENT,
    wedding_owner_email TEXT NOT NULL,
    name TEXT,
    gender TEXT,
    side TEXT,
    num_women INTEGER DEFAULT 0,
    num_men INTEGER DEFAULT 0,
    num_kids INTEGER DEFAULT 0,
    FOREIGN KEY (wedding_owner_email) REFERENCES wedding_owner (email)
);
''';

String venueOwnerTableSQL = '''
CREATE TABLE venue_owner (
    email TEXT PRIMARY KEY,
    gender TEXT,
    phone_number TEXT,
    FOREIGN KEY (email) REFERENCES account (email)
);
''';

String venueTableSQL = '''
CREATE TABLE venue (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    wilaya TEXT NOT NULL,
    about TEXT,
    price_min REAL,
    price_max REAL,
    pricing_details TEXT,
    venue_owner_email TEXT NOT NULL,
    FOREIGN KEY (venue_owner_email) REFERENCES venue_owner (email),
    CHECK (price_min <= price_max)
);
''';

String likedVenuesTableSQL = '''
CREATE TABLE liked_venues (
    wedding_owner_email TEXT NOT NULL,
    venue_id INTEGER NOT NULL,
    is_liked BOOLEAN DEFAULT 0,
    PRIMARY KEY (wedding_owner_email, venue_id),
    FOREIGN KEY (wedding_owner_email) REFERENCES wedding_owner (email),
    FOREIGN KEY (venue_id) REFERENCES venue (id)
);
''';

String venueImagesTableSQL = '''
CREATE TABLE venue_image (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venue_id INTEGER NOT NULL,
    image_url TEXT NOT NULL,
    FOREIGN KEY (venue_id) REFERENCES venue (id)
);
''';

String venueReviewTableSQL = '''
CREATE TABLE venue_review (
    wedding_owner_email TEXT NOT NULL,
    venue_id INTEGER NOT NULL,
    review_value INTEGER,
    PRIMARY KEY (wedding_owner_email, venue_id),
    FOREIGN KEY (wedding_owner_email) REFERENCES wedding_owner (email),
    FOREIGN KEY (venue_id) REFERENCES venue (id),
    CHECK (review_value >= 1 AND review_value <= 5)
);
''';

String vendorTableSQL = '''
CREATE TABLE vendor (
    email TEXT PRIMARY KEY,
    phone_number TEXT,
    city TEXT,
    wilaya TEXT,
    gender TEXT,
    about TEXT,
    price_min REAL,
    price_max REAL,
    pricing_details TEXT,
    theme TEXT,
    activated BOOLEAN DEFAULT 0,
    FOREIGN KEY (email) REFERENCES account (email),
    CHECK (price_min <= price_max)
);
''';

String vendorImagesTableSQL = '''
CREATE TABLE vendor_image (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vendor_email TEXT NOT NULL,
    image_url TEXT NOT NULL,
    FOREIGN KEY (vendor_email) REFERENCES vendor (email)
);
''';

String likedVendorTableSQL = '''
CREATE TABLE liked_vendor (
    wedding_owner_email TEXT NOT NULL,
    vendor_email TEXT NOT NULL,
    is_liked BOOLEAN DEFAULT 0,
    PRIMARY KEY (wedding_owner_email, vendor_email),
    FOREIGN KEY (wedding_owner_email) REFERENCES wedding_owner (email),
    FOREIGN KEY (vendor_email) REFERENCES vendor (email)
);
''';

String vendorReviewTableSQL = '''
CREATE TABLE vendor_review (
    wedding_owner_email TEXT NOT NULL,
    vendor_email TEXT NOT NULL,
    review_value INTEGER,
    PRIMARY KEY (wedding_owner_email, vendor_email),
    FOREIGN KEY (wedding_owner_email) REFERENCES wedding_owner (email),
    FOREIGN KEY (vendor_email) REFERENCES vendor (email),
    CHECK (review_value >= 1 AND review_value <= 5)
);
''';
