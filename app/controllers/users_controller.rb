function updateAvatar(event) {
  const file = event.target.files[0]; // Récupère le fichier sélectionné
  const reader = new FileReader();

  if (file) {
    reader.onload = function (e) {
      // Met à jour l'avatar
      const avatarImage = document.getElementById("avatar-image");
      const avatarIcon = document.getElementById("avatar-icon");

      avatarImage.src = e.target.result; // Charge l'image
      avatarImage.style.display = "block"; // Affiche l'avatar
      avatarIcon.style.display = "none"; // Masque l'icône
    };
    reader.readAsDataURL(file); // Convertit le fichier en URL base64
  }
}
