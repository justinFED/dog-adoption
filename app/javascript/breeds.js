document.addEventListener("turbolinks:load", function() {
  const breedSelect = document.getElementById('dog_breed');
  const descriptionField = document.getElementById('dog_description');
  console.log(breedSelect)
  breedSelect.addEventListener('change', function() {
    const breedName = this.value;
    fetch(`/breeds/${encodeURIComponent(breedName)}/temperament`)
      .then(response => response.json())
      .then(data => {
        descriptionField.value = data.temperament || 'Temperament not found';
      })
      .catch(error => console.error('Error fetching temperament:', error));
  });
});