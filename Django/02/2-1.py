from urllib.request import urlopen
f = urlopen("http://www.example.com")
print(f.read(500).decode('utf-8'))