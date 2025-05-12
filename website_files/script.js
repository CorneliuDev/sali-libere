let actualData;

function sendData()
{
  const week = document.getElementById("week").value;
  const day = document.getElementById("day").value;
  const hour = document.getElementById("hour").value;
  fetch("/getFreeClassrooms", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ week, day, hour })
  }).then(response => response.json()).
  then(data => {
    actualData = data['message'][0]['actual_rooms'].split(';');
    getFreeClassrooms();
  }).
  catch(error => console.log(`Error: ${error}`));
}

function getFreeClassrooms() {
  const week = document.getElementById("week").value;
  const day = document.getElementById("day").value;
  const hour = document.getElementById("hour").value;

  let avalable = actualData;

  let roomsDiv = document.getElementById("classrooms");
  roomsDiv.innerHTML = "";
  roomsDiv.classList.add("mt-12");

  avalable.forEach(room => {
    let roomButton = document.createElement("button");
    roomButton.textContent = room;
    roomButton.className = "border-2 rounded-lg h-14 max-w-80 border-black transition-all duration-300 transform active:scale-95";
    roomButton.onclick = () => showModal(room, week, day, hour);
    roomsDiv.appendChild(roomButton);
  });
}

function showModal(room, week, day, hour) {
  const modal = document.getElementById("modal");
  document.getElementById("modalText").innerHTML = `Vrei să marchezi clasa <b>${room}</b> ca ocupată?`;
  modal.classList.remove("hidden");

  const confirmYes = document.getElementById("confirmYes");
  confirmYes.onclick = () => {
    fetch('/updateRooms', {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ room, week, day, hour })
    }).then(sendData);
    modal.classList.add("hidden");
  }

  const confirmNo = document.getElementById("confirmNo");

  confirmNo.onclick = () => {
    modal.classList.add("hidden");
  }
}