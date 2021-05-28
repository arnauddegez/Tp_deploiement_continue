import hashlib




m = hashlib.md5()
m.update("rock")
print m.hexdigest()

m = hashlib.sha256()
m.update("rock")
print m.hexdigest()