# PowerShell script to download movie poster images to the local images folder

$images = @(
    @{url="https://upload.wikimedia.org/wikipedia/en/7/7a/Social_network_film_poster.jpg"; filename="images/social_network.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/en/2/2e/Steve_Jobs_film_poster.jpg"; filename="images/steve_jobs.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/en/5/5f/Hackers_movie_poster.jpg"; filename="images/hackers.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/en/0/0a/Tron_1982_film_poster.jpg"; filename="images/tron.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/en/e/e6/WarGames_movie_poster.jpg"; filename="images/wargames.jpg"}
)

# Create images directory if it doesn't exist
if (-not (Test-Path -Path "images")) {
    New-Item -ItemType Directory -Path "images"
}

foreach ($image in $images) {
    Write-Host "Downloading $($image.url) to $($image.filename)"
    Invoke-WebRequest -Uri $image.url -OutFile $image.filename
}
