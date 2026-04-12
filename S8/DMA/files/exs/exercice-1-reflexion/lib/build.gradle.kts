plugins {
    id("java-library")
    kotlin("jvm")
}

dependencies {
    implementation(libs.kotlin.reflect)
    implementation(libs.org.json)
}
