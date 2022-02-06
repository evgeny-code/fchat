const Map<int, String> migrations = {
  1: '''
  CREATE TABLE settings 
  (
  id VARCHAR(256) PRIMARY KEY, 
  serverUrl VARCHAR(256), 
  privateKeyB64 TEXT, 
  publicKeyB64 TEXT
  );
  ''',

  2: '''
  CREATE TABLE contacts 
  (
  keyHash VARCHAR(256) PRIMARY KEY,
  publicKeyB64 TEXT,
  name VARCHAR(256)
  );
  ''',

  3: '''
  CREATE TABLE messages 
  (
  idHash VARCHAR(256) PRIMARY KEY,
  type VARCHAR(32),
  timeUTC INTEGER,
  from_u VARCHAR(256),
  to_u VARCHAR(256),
  content TEXT
  );
  ''',
};