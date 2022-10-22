postgres:
	docker run --name my-postgres -p 5432:5432 -e POSTGRES_PASSWORD=54768203 -d postgres

psql:
	docker run -it --rm --network host postgres psql -h localhost -U postgres

createdb:
	docker exec -it my-postgres createdb --username=postgres --owner=postgres photo-blog

migrateup:
	migrate -path db/migrate -database "postgresql://postgres:54768203@localhost:5432/photo-blog?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrate -database "postgresql://postgres:54768203@localhost:5432/photo-blog?sslmode=disable" -verbose down

.PHONY: postgres psql createdb migrateup migratedown