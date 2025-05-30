Use mh_web_app;


CREATE TABLE divisions (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE districts (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    division_id INT,
    FOREIGN KEY (division_id) REFERENCES divisions(id)
);

CREATE TABLE blocks (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    district_id INT,
    FOREIGN KEY (district_id) REFERENCES districts(id)
);

CREATE TABLE grampanchayats (
    LGD_Code INT PRIMARY KEY,
    name VARCHAR(350) NOT NULL,
    block_id INT,
    FOREIGN KEY (block_id) REFERENCES blocks(id)
);

CREATE TABLE IF NOT EXISTS vle_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    csc_id VARCHAR(12) NOT NULL,
    
    -- GP Details (now storing names instead of IDs)
    vle_type ENUM('individual', 'cluster') NOT NULL DEFAULT 'individual',
    division VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    block VARCHAR(100) NOT NULL,
    grampanchayat VARCHAR(100) NOT NULL,
    lgd_code int,  -- This will store grampanchayat_id
    
    -- Rest of the columns remain the same as before
    first_name VARCHAR(50) NOT NULL,
    father_name VARCHAR(50) NOT NULL,
    mother_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    blood_group VARCHAR(3),
    gender VARCHAR(10) NOT NULL,
    marital_status VARCHAR(15) NOT NULL,
    spouse_name VARCHAR(50),
    num_children INT,
    anniversary_date DATE,
    religion VARCHAR(20) NOT NULL,
    category VARCHAR(20) NOT NULL,
    caste VARCHAR(50),
    education VARCHAR(20) NOT NULL,
    institute_name VARCHAR(100) NOT NULL,
    cibil_score SMALLINT CHECK (cibil_score BETWEEN 300 AND 900),
    contact_number VARCHAR(10) NOT NULL,
    whatsapp_number VARCHAR(10),
    email VARCHAR(100) NOT NULL,
    permanent_address TEXT NOT NULL,
    current_address TEXT,
    pan_number VARCHAR(10),
    aadhar_number VARCHAR(12),
    bank_name VARCHAR(50),
    ifsc_code VARCHAR(11),
    account_number VARCHAR(20),
    branch_name VARCHAR(50),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (csc_id)
);

