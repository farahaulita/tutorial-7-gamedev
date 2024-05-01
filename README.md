### Tutorial 7
## Pembuatan Mekanisme Sprint dan Crouch
# Input
Pertama yang dilakukan adalah menambah input mapping untuk sprint dan crouch pada project settings seperti berikut:

![image](https://github.com/farahaulita/tutorial-7-gamedev/assets/92159879/83502d9a-8fe2-45d9-a899-d1483c972bcb)

# Variabel baru
Pada script ditambahkan beberapa variabel baru, yaitu crouch_speed dan sprint_speed. Variabel ini menyimpan kecepatan sprint dan crouch. Lalu, ada juga variabel sprint dan crouch yang dapat bernilai 1 atau 0, ini untuk menyatakan state sedang crouch/sprint atau tidak.

![image](https://github.com/farahaulita/tutorial-7-gamedev/assets/92159879/9bb8ec17-491b-475b-a7fb-429747e67968)

# Input dan state
pada _process(delta), ditambahkan beberapa kondisi jika button crouch atau sprint baru saja ditekan atau di-release. Saat ditekan, variabel terkait akan berubah menjadi 1. Jika dilepas, variabel terkait akan berubah menjadi 0. Khusus untuk crouch, head akan di translate di sumbu y .

![image](https://github.com/farahaulita/tutorial-7-gamedev/assets/92159879/6354c528-4e1d-4e71-a102-5bfa326493d0)

# Pergerakan
Terdapat sebuah variabel current_speed pada _physics_process(delta). Default speed adalah speed normal. Jika sprint aktif maka current_speed akan bernilai sprint_speed, dan jika crouch aktif, current speed akan bernilai crouch_speed.

![image](https://github.com/farahaulita/tutorial-7-gamedev/assets/92159879/ecd7f30d-6963-473f-b63f-8590c5d51608)

