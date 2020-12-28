Users = {};

Users.remove_ideaCard = function(userId) {
  document.getElementById("user-" + userId).parentElement.remove();
};
