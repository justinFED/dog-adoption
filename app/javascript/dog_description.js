document.addEventListener('DOMContentLoaded', function() {
    const breedSelect = document.getElementById('dog_breed_select');
    const temperamentDiv = document.getElementById('dog-temperament');
  
    if (breedSelect && temperamentDiv) {
      breedSelect.addEventListener('change', function() {
        const selectedBreed = encodeURIComponent(breedSelect.value);
  
        fetch(`/breeds/${selectedBreed}/temperament`)
          .then(response => {
            if (!response.ok) {
              throw new Error('Breed not found');
            }
            return response.json();
          })
          .then(data => {
            temperamentDiv.innerText = data.temperament;
          })
          .catch(error => {
            temperamentDiv.innerText = 'Temperament not found for the selected breed.';
            console.error('Error fetching dog temperament:', error);
          });
      });
    }
  });
  