<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ - The Best Pizza</title>
    <link rel="stylesheet" href="css/style.css"> 
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, #ff9a8b, #ff6a88, #ff99ac);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            position: relative;
        }
        .faq-container {
            max-width: 800px;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.5s ease-in-out;
            margin-top: 20px;
            overflow-y: auto;
            max-height: 80vh;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            text-align: center;
            color: #b33c2e;
            font-size: 28px;
            margin-bottom: 15px;
        }
        .search-box {
            width: 100%;
            padding: 10px;
            border: 2px solid #b33c2e;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 16px;
        }
        .faq {
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .question {
            font-weight: bold;
            cursor: pointer;
            padding: 12px;
            background: #b33c2e;
            color: white;
            border-radius: 5px;
            transition: 0.3s;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .question:hover {
            background: #922d22;
        }
        .answer {
            display: none;
            padding: 10px;
            background: #f9f9f9;
            border-left: 3px solid #b33c2e;
            border-radius: 5px;
            margin-top: 5px;
        }
        .footer {
            position: absolute;
            bottom: 10px;
            font-size: 12px;
            color: white;
            text-align: center;
            width: 100%;
        }
    </style>
</head>
<body>
    <?php include 'header.php'; ?>
    
    <div class="faq-container">
        <h2>Frequently Asked Questions</h2>
        <input type="text" class="search-box" placeholder="Search FAQ..." onkeyup="searchFAQ()">
        
        <div class="faq">
            <div class="question">🍕 What is The Best Pizza? <span class="toggle">+</span></div>
            <div class="answer">The Best Pizza is your go-to place for delicious, handcrafted pizzas made with fresh ingredients and love!</div>
        </div>
        
        <div class="faq">
            <div class="question">🛵 Do you offer delivery services? <span class="toggle">+</span></div>
            <div class="answer">Yes! We offer fast and hot delivery right to your doorstep. Just place your order online!</div>
        </div>

        <div class="faq">
            <div class="question">💳 What payment methods do you accept? <span class="toggle">+</span></div>
            <div class="answer">We accept credit/debit cards, PayPal, and cash on delivery.</div>
        </div>

        <div class="faq">
            <div class="question">⏳ How long does delivery take? <span class="toggle">+</span></div>
            <div class="answer">Delivery usually takes between 30-45 minutes, depending on your location.</div>
        </div>

        <div class="faq">
            <div class="question">🏬 Do you have a physical store? <span class="toggle">+</span></div>
            <div class="answer">Yes! You can visit our store at our main branch for dine-in services.</div>
        </div>

        <div class="faq">
            <div class="question">🔥 What are your best-selling pizzas? <span class="toggle">+</span></div>
            <div class="answer">Our best-selling pizzas are Pepperoni Feast, BBQ Chicken Deluxe, and Four Cheese Special.</div>
        </div>

        <div class="faq">
            <div class="question">📦 Can I order in bulk for an event? <span class="toggle">+</span></div>
            <div class="answer">Yes! We offer bulk orders for parties and events.</div>
        </div>

        <div class="faq">
            <div class="question">❄️ How do I reheat my pizza? <span class="toggle">+</span></div>
            <div class="answer">For best results, reheat in an oven at 180°C for 5-7 minutes.</div>
        </div>
    </div>
    
    
    
    <script>
        document.querySelectorAll('.question').forEach(item => {
            item.addEventListener('click', () => {
                const answer = item.nextElementSibling;
                const toggle = item.querySelector('.toggle');
                
                document.querySelectorAll('.answer').forEach(ans => {
                    if (ans !== answer) ans.style.display = 'none';
                });
                document.querySelectorAll('.toggle').forEach(tog => {
                    if (tog !== toggle) tog.innerText = '+';
                });
                
                answer.style.display = answer.style.display === 'block' ? 'none' : 'block';
                toggle.innerText = answer.style.display === 'block' ? '-' : '+';
            });
        });
        
        function searchFAQ() {
            let input = document.querySelector('.search-box').value.toLowerCase();
            document.querySelectorAll('.faq').forEach(faq => {
                let questionText = faq.querySelector('.question').innerText.toLowerCase();
                faq.style.display = questionText.includes(input) ? 'block' : 'none';
            });
        }
    </script>
</body>
</html>
