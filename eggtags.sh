echo "22-JDK
17-JDK
11-EE
11
17
21-JDK
21-temurin
19
17-EE
19-EE
20-JDK
22-OC
22-temurin
23-OC
23-temurin" | sed -re 's/(.*)$/GraalVM &|ghcr.io\/quantrieupcyt\/pterodactyl-graalvm:&/'

# Copy this list into dashboard.acme.co/admin/nests/egg/<the egg ofc>
echo "

GraalVM 22-JDK|ghcr.io/quantrieupcyt/pterodactyl-graalvm:22-JDK
GraalVM 17-JDK|ghcr.io/quantrieupcyt/pterodactyl-graalvm:17-JDK
GraalVM 11-EE|ghcr.io/quantrieupcyt/pterodactyl-graalvm:11-EE
GraalVM 11|ghcr.io/quantrieupcyt/pterodactyl-graalvm:11
GraalVM 17|ghcr.io/quantrieupcyt/pterodactyl-graalvm:17
GraalVM 21-JDK|ghcr.io/quantrieupcyt/pterodactyl-graalvm:21-JDK
GraalVM 19|ghcr.io/quantrieupcyt/pterodactyl-graalvm:19
GraalVM 17-EE|ghcr.io/quantrieupcyt/pterodactyl-graalvm:17-EE
GraalVM 19-EE|ghcr.io/quantrieupcyt/pterodactyl-graalvm:19-EE
GraalVM 20-JDK|ghcr.io/quantrieupcyt/pterodactyl-graalvm:20-JDK
GraalVM 22-OC|ghcr.io/quantrieupcyt/pterodactyl-graalvm:22-OC
GraalVM 23-OC|ghcr.io/quantrieupcyt/pterodactyl-graalvm:23-OC
Temurin 22|ghcr.io/quantrieupcyt/pterodactyl-graalvm:22-temurin
Temurin 21|ghcr.io/quantrieupcyt/pterodactyl-graalvm:21-temurin
Temurin 23|ghcr.io/quantrieupcyt/pterodactyl-graalvm:23-temurin

" > /dev/null
