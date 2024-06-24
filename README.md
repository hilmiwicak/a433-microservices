# a433-microservices

Repository ini digunakan untuk kebutuhan kelas Belajar Membangun Arsitektur Microservices dari Dicoding.

Terdapat 6 branch utama :

1. todo-app

    latihan membuat todo app dengan docker. stack yang digunakan : mysql dan node js (express). menjalankan express bisa dengan menggunakan Dockerfile atau menggunakan docker-compose.

2. proyek-pertama

    submission 1, deploy app menggunakan docker compose, dan upload docker image ke repository. stack : mongodb dan node js (express).

3. karsajobs dan karsajobs-ui

    submission 2, deploy simple web app bernama Karsa Jobs yang bisa melihat dan menambah informasi lowongan pekerjaan. komponen : frontend vue, backend API Go, db mongodb. tambahan upload docker image, mengimplementasi monitoring prometheus dan grafana, dan CI.

4. order-service dan shipping-service

    submission 3, deploy app E-commerce app. order service bertugas menerima data order dalam bentuk JSON yang mengirim data order ke shipping service via RabbitMQ, sementara shipping service mengambil data order yang dikirim order service di queue, lalu print order tersebut ke console. tambahan deploy ke kubernetes dan implementasi service mesh menggunakan Istio.
