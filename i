<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <title>Чат с друзьями</title>
    <meta name="description" content="Чат с друзьями">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
            color: #333;
        }

        .container {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .sidebar {
            width: 100%;
            background-color: #2c2c2c;
            color: #fff;
            border-bottom: 1px solid #3a3a3a;
            overflow-y: auto;
            padding: 20px;
        }

        .sidebar h2 {
            margin-bottom: 20px;
            font-size: 1.5em;
        }

        .friend-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            overflow-x: auto;
        }

        .friend-item {
            padding: 15px;
            cursor: pointer;
            transition: background-color 0.3s;
            border-radius: 8px;
            margin-right: 10px;
            display: flex;
            align-items: center;
            flex-shrink: 0;
        }

        .friend-item img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .friend-item:hover {
            background-color: #3a3a3a;
        }

        .chat-window {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding: 20px;
            background-color: #fff;
        }

        .chat-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .chat-header img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .chat-header h3 {
            margin: 0;
            flex: 1;
        }

        .chat-header button {
            background: none;
            border: none;
            color: #007bff;
            cursor: pointer;
            font-size: 1.2em;
        }

        .messages {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }

        .message {
            margin: 10px 0;
            padding: 15px;
            border-radius: 10px;
            position: relative;
            max-width: 70%;
            word-wrap: break-word;
        }

        .sent {
            background-color: #dcf8c6;
            text-align: right;
            margin-left: auto;
        }

        .received {
            background-color: #fff;
            text-align: left;
            margin-right: auto;
            border: 1px solid #ddd;
        }

        .input-area {
            display: flex;
            align-items: center;
        }

        .input-area input[type="text"] {
            flex: 1;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 20px;
            margin-right: 10px;
            font-size: 1em;
        }

        .input-area button {
            padding: 10px 20px;
            border: none;
            background-color: #0088cc;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            font-size: 1em;
        }

        .input-area button:hover {
            background-color: #005f8f;
        }

        .message-time {
            font-size: 0.8em;
            color: #888;
            position: absolute;
            bottom: 5px;
            right: 10px;
        }

        .input-area input[type="file"] {
            display: none;
        }

        .upload-button {
            padding: 10px;
            border: none;
            background-color: #28a745;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            margin-right: 10px;
        }

        .upload-button:hover {
            background-color: #218838;
        }

        .profile-modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }

        .profile-modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 10px;
        }

        .profile-modal-content img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .profile-modal-content h2 {
            margin-top: 0;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .video-container {
            margin: 20px 0;
            position: relative;
        }

        .video-container video {
            width: 100%;
            border-radius: 10px;
        }

        .like-button {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: none;
            border: none;
            color: red;
            font-size: 1.5em;
            cursor: pointer;
        }

        .emoji-picker {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .emoji-picker button {
            background: none;
            border: none;
            font-size: 1.5em;
            cursor: pointer;
        }

        .stories-container {
            display: flex;
            overflow-x: auto;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }

        .story {
            margin-right: 10px;
            cursor: pointer;
            position: relative;
            flex-shrink: 0;
        }

        .story img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #fff;
        }

        .story .story-ring {
            position: absolute;
            top: -5px;
            left: -5px;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(45deg, #f06, #3f6);
            animation: rotate 2s linear infinite;
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }

        .story-modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.9);
        }

        .story-modal-content {
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 10px;
            background-color: #fff;
        }

        .story-modal-content video {
            width: 100%;
            border-radius: 10px;
        }

        .story-modal-content .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .story-modal-content .close:hover,
        .story-modal-content .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .top-stories {
            display: flex;
            overflow-x: auto;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
            background-color: #fff;
        }

        .top-story {
            margin-right: 10px;
            cursor: pointer;
            position: relative;
            flex-shrink: 0;
        }

        .top-story img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #fff;
        }

        .top-story .story-ring {
            position: absolute;
            top: -5px;
            left: -5px;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(45deg, #f06, #3f6);
            animation: rotate 2s linear infinite;
        }

        @media (min-width: 600px) {
            .container {
                flex-direction: row;
            }

            .sidebar {
                width: 280px;
                border-right: 1px solid #3a3a3a;
                border-bottom: none;
            }

            .friend-list {
                display: block;
                overflow-x: hidden;
            }

            .friend-item {
                margin-right: 0;
                margin-bottom: 10px;
            }

            .chat-window {
                flex: 1;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <nav class="sidebar">
            <h2>Друзья</h2>
            <ul class="friend-list" id="friendList">
                <!-- Friends will be dynamically added here -->
            </ul>
            <button id="logoutBtn">Выйти</button>
        </nav>

        <main class="chat-window">
            <div class="top-stories" id="topStoriesContainer">
                <!-- Top stories will be dynamically added here -->
            </div>
            <div class="chat-header">
                <img src="https://via.placeholder.com/40" alt="Friend Avatar" id="friendAvatar">
                <h3 id="friendName">Выберите друга для начала чата.</h3>
                <button id="viewProfileBtn">👤</button>
                <button id="searchBtn">🔍</button>
            </div>
            <div class="stories-container" id="storiesContainer">
                <!-- Stories will be dynamically added here -->
            </div>
            <div class="messages" id="messages">
                <p>Выберите друга для начала чата.</p>
            </div>
            <div class="input-area">
                <input type="file" id="fileInput" accept="image/*,video/*">
                <button class="upload-button" id="uploadBtn">📎</button>
                <input type="text" id="messageInput" placeholder="Введите сообщение...">
                <button id="sendBtn">Отправить</button>
            </div>
            <div class="emoji-picker">
                <menu>
                <button>😊</button>
                <button>👍</button>
                <button>❤️</button>
                <button>😂</button>
                <button>😮</button>
            </menu>
            </div>
        </main>
    </div>

    <div id="profileModal" class="profile-modal">
        <div class="profile-modal-content">
            <span class="close">&times;</span>
            <img src="https://via.placeholder.com/100" alt="Friend Avatar" id="profileAvatar">
            <h2 id="profileName">Имя друга</h2>
            <p id="profileInfo">Информация о друге...</p>
        </div>
    </div>

    <div id="storyModal" class="story-modal">
        <div class="story-modal-content">
            <span class="close">&times;</span>
            <video controls id="storyVideo">
                <source id="storySource" type="video/mp4">
            </video>
        </div>
    </div>

    <div id="loginModal" class="profile-modal">
        <div class="profile-modal-content">
            <span class="close">&times;</span>
            <h2>Войти</h2>
            <input type="text" id="loginInput" placeholder="Введите имя пользователя">
            <button id="loginBtn">Войти</button>
        </div>
    </div>

    <script>
        const messagesDiv = document.getElementById('messages');
        const messageInput = document.getElementById('messageInput');
        const sendBtn = document.getElementById('sendBtn');
        const fileInput = document.getElementById('fileInput');
        const uploadBtn = document.getElementById('uploadBtn');
        const friendName = document.getElementById('friendName');
        const friendAvatar = document.getElementById('friendAvatar');
        const viewProfileBtn = document.getElementById('viewProfileBtn');
        const searchBtn = document.getElementById('searchBtn');
        const profileModal = document.getElementById('profileModal');
        const profileName = document.getElementById('profileName');
        const profileInfo = document.getElementById('profileInfo');
        const profileAvatar = document.getElementById('profileAvatar');
        const closeModal = document.getElementsByClassName('close')[0];
        const storiesContainer = document.getElementById('storiesContainer');
        const storyModal = document.getElementById('storyModal');
        const storyVideo = document.getElementById('storyVideo');
        const storySource = document.getElementById('storySource');
        const closeStoryModal = storyModal.getElementsByClassName('close')[0];
        const topStoriesContainer = document.getElementById('topStoriesContainer');
        const friendList = document.getElementById('friendList');
        const loginModal = document.getElementById('loginModal');
        const loginInput = document.getElementById('loginInput');
        const loginBtn = document.getElementById('loginBtn');
        const logoutBtn = document.getElementById('logoutBtn');

        let currentUser = null;
        let currentFriend = '';
        let friends = {
            friend1: [],
            friend2: [],
            friend3: [],
            friend4: [],
            friend5: []
        };

        let stories = {
            friend1: [{
                src: 'https://www.w3schools.com/html/mov_bbb.mp4',
                type: 'video/mp4'
            }],
            friend2: [{
                src: 'https://www.w3schools.com/html/mov_bbb.mp4',
                type: 'video/mp4'
            }],
            friend3: [{
                src: 'https://www.w3schools.com/html/mov_bbb.mp4',
                type: 'video/mp4'
            }],
            friend4: [{
                src: 'https://www.w3schools.com/html/mov_bbb.mp4',
                type: 'video/mp4'
            }],
            friend5: [{
                src: 'https://www.w3schools.com/html/mov_bbb.mp4',
                type: 'video/mp4'
            }]
        };

        const users = {
            user1: { name: 'Пользователь 1', friends: ['friend1', 'friend2'] },
            user2: { name: 'Пользователь 2', friends: ['friend3', 'friend4'] },
            user3: { name: 'Пользователь 3', friends: ['friend5'] }
        };

        function loadFriends() {
            friendList.innerHTML = '';
            if (currentUser) {
                users[currentUser].friends.forEach(friend => {
                    const friendItem = document.createElement('li');
                    friendItem.className = 'friend-item';
                    friendItem.dataset.friend = friend;
                    friendItem.innerHTML = `<img src="https://via.placeholder.com/40" alt="${friend}"> ${friend}`;
                    friendItem.addEventListener('click', () => {
                        currentFriend = friend;
                        friendName.textContent = `Чат с ${friend}`;
                        friendAvatar.src = `https://via.placeholder.com/40`;
                        loadMessages();
                        loadStories();
                    });
                    friendList.appendChild(friendItem);
                });
            }
        }

        loginBtn.addEventListener('click', () => {
            currentUser = loginInput.value.trim();
            if (users[currentUser]) {
                loginModal.style.display = 'none';
                loadFriends();
            } else {
                alert('Пользователь не найден');
            }
        });

        logoutBtn.addEventListener('click', () => {
            currentUser = null;
            currentFriend = '';
            friendList.innerHTML = '';
            messagesDiv.innerHTML = '<p>Выберите друга для начала чата.</p>';
            loginModal.style.display = 'block';
        });

        document.querySelectorAll('.friend-item').forEach(item => {
            item.addEventListener('click', event => {
                currentFriend = event.target.dataset.friend || event.target.parentElement.dataset.friend;
                friendName.textContent = `Чат с ${currentFriend}`;
                loadMessages();
                loadStories();
            });
        });

        sendBtn.addEventListener('click', () => {
            const messageText = messageInput.value.trim();
            if (messageText) {
                sendMessage(messageText);
                messageInput.value = '';
            }
        });

        uploadBtn.addEventListener('click', () => {
            fileInput.click();
        });

        fileInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function () {
                    if (file.type.startsWith('image/')) {
                        sendMessage(`<img src="${reader.result}" style="max-width: 100%; border-radius: 10px;">`);
                    } else if (file.type.startsWith('video/')) {
                        sendMessage(`<div class="video-container"><video controls><source src="${reader.result}" type="${file.type}"></video><button class="like-button">❤️</button></div>`);
                    }
                };
                reader.readAsDataURL(file);
            }
        });

        viewProfileBtn.addEventListener('click', () => {
            profileName.textContent = currentFriend;
            profileInfo.textContent = `Информация о ${currentFriend}...`;
            profileAvatar.src = `https://via.placeholder.com/100`;
            profileModal.style.display = 'block';
        });

        searchBtn.addEventListener('click', () => {
            const searchTerm = prompt('Введите текст для поиска:');
            if (searchTerm) {
                searchMessages(searchTerm);
            }
        });

        closeModal.addEventListener('click', () => {
            profileModal.style.display = 'none';
            loginModal.style.display = 'none';
        });

        window.addEventListener('click', (event) => {
            if (event.target == profileModal || event.target == loginModal) {
                profileModal.style.display = 'none';
                loginModal.style.display = 'none';
            }
        });

        document.querySelectorAll('.emoji-picker button').forEach(button => {
            button.addEventListener('click', () => {
                messageInput.value += button.textContent;
            });
        });

        function sendMessage(content) {
            const message = {
                text: content,
                type: 'sent',
                time: new Date().toLocaleTimeString(),
                id: Date.now() // уникальный идентификатор для редактирования/удаления
            };
            friends[currentFriend].push(message);
            saveMessages();
            updateMessages();
        }

        function loadMessages() {
            messagesDiv.innerHTML = '';
            updateMessages();
        }

        function updateMessages() {
            messagesDiv.innerHTML = '';
            if (friends[currentFriend].length === 0) {
                messagesDiv.innerHTML = '<p>Нет сообщений.</p>';
            } else {
                friends[currentFriend].forEach(msg => {
                    const messageElement = document.createElement('div');
                    messageElement.className = `message ${msg.type}`;
                    messageElement.innerHTML = `
                        ${msg.text}
                        <span class="message-time">${msg.time}</span>
                        <button class="edit-button" data-id="${msg.id}">✏️</button>
                        <button class="delete-button" data-id="${msg.id}">🗑️</button>
                    `;
                    messageElement.querySelector('.edit-button').addEventListener('click', () => editMessage(msg.id));
                    messageElement.querySelector('.delete-button').addEventListener('click', () => deleteMessage(msg.id));
                    messagesDiv.appendChild(messageElement);
                });
            }
            messagesDiv.scrollTop = messagesDiv.scrollHeight; // Прокрутка вниз
        }

        function saveMessages() {
            localStorage.setItem('chatMessages', JSON.stringify(friends));
        }

        function editMessage(messageId) {
            const message = friends[currentFriend].find(msg => msg.id === messageId);
            if (message) {
                messageInput.value = message.text; // Заполняем поле ввода текстом сообщения
                sendBtn.onclick = () => {
                    message.text = messageInput.value.trim();
                    saveMessages();
                    updateMessages();
                    messageInput.value = ''; // Очищаем поле ввода
                    sendBtn.onclick = sendMessage; // Возвращаем стандартное действие кнопки
                };
            }
        }

        function deleteMessage(messageId) {
            friends[currentFriend] = friends[currentFriend].filter(msg => msg.id !== messageId);
            saveMessages();
            updateMessages();
        }

        function searchMessages(searchTerm) {
            const filteredMessages = friends[currentFriend].filter(msg =>
                msg.text.toLowerCase().includes(searchTerm.toLowerCase())
            );
            messagesDiv.innerHTML = '';
            if (filteredMessages.length === 0) {
                messagesDiv.innerHTML = '<p>Нет сообщений, соответствующих поиску.</p>';
            } else {
                filteredMessages.forEach(msg => {
                    const messageElement = document.createElement('div');
                    messageElement.className = `message ${msg.type}`;
                    messageElement.innerHTML = `
                        ${msg.text}
                        <span class="message-time">${msg.time}</span>
                        <button class="edit-button" data-id="${msg.id}">✏️</button>
                        <button class="delete-button" data-id="${msg.id}">🗑️</button>
                    `;
                    messageElement.querySelector('.edit-button').addEventListener('click', () => editMessage(msg.id));
                    messageElement.querySelector('.delete-button').addEventListener('click', () => deleteMessage(msg.id));
                    messagesDiv.appendChild(messageElement);
                });
            }
        }

        function loadStories() {
            storiesContainer.innerHTML = '';
            if (stories[currentFriend]) {
                stories[currentFriend].forEach((story, index) => {
                    const storyElement = document.createElement('div');
                    storyElement.className = 'story';
                    storyElement.innerHTML = `
                        <div class="story-ring"></div>
                        <img src="https://via.placeholder.com/60" alt="Story">
                    `;
                    storyElement.addEventListener('click', () => openStory(story.src, story.type));
                    storiesContainer.appendChild(storyElement);
                });
            }
        }

        function openStory(src, type) {
            storySource.src = src;
            storySource.type = type;
            storyVideo.load();
            storyModal.style.display = 'block';
        }

        closeStoryModal.addEventListener('click', () => {
            storyModal.style.display = 'none';
            storyVideo.pause();
            storyVideo.currentTime = 0;
        });

        window.addEventListener('click', (event) => {
            if (event.target == storyModal) {
                storyModal.style.display = 'none';
                storyVideo.pause();
                storyVideo.currentTime = 0;
            }
        });

        function loadTopStories() {
            topStoriesContainer.innerHTML = '';
            Object.keys(stories).forEach(friend => {
                if (stories[friend].length > 0) {
                    const topStoryElement = document.createElement('div');
                    topStoryElement.className = 'top-story';
                    topStoryElement.innerHTML = `
                        <div class="story-ring"></div>
                        <img src="https://via.placeholder.com/60" alt="${friend} Story">
                    `;
                    topStoryElement.addEventListener('click', () => openStory(stories[friend][0].src, stories[friend][0].type));
                    topStoriesContainer.appendChild(topStoryElement);
                }
            });
        }

        // Загрузка сообщений при загрузке страницы
        window.onload = () => {
            const savedMessages = localStorage.getItem('chatMessages');
            if (savedMessages) {
                friends = JSON.parse(savedMessages);
            }
            loginModal.style.display = 'block';
            loadTopStories();
        };
    </script>
</body>

</html>
