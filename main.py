#!/usr/bin/env python3
import argparse
import os
import uuid

import google.cloud.storage

parser = argparse.ArgumentParser()
parser.add_argument('bucket')
parser.add_argument('--filename', default=str(uuid.uuid4()))
parser.add_argument('--filesize', type=int, default=1_000_000_000)
args = parser.parse_args()

storage = google.cloud.storage.Client()
bucket = storage.bucket(args.bucket)
blob = bucket.blob(args.filename)
payload = b'A' * args.filesize
print(f'Uploading {len(payload)} bytes to gs://{args.bucket}/{args.filename}')
blob.upload_from_string(payload)
