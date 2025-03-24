<?php
include 'admin/db_connect.php';

$limit = 10;
$page = (isset($_GET['_page']) && $_GET['_page'] > 0) ? $_GET['_page'] - 1 : 0;
$offset = $page > 0 ? $page * $limit : 0;

$all_menu = $conn->query("SELECT id FROM product_list")->num_rows;
$page_btn_count = ceil($all_menu / $limit);

// Fetch categories
$category_result = $conn->query("SELECT DISTINCT c.name 
                                 FROM category_list c
                                 JOIN product_list p ON c.id = p.category_id
                                 WHERE c.name IS NOT NULL AND c.name != ''");
$categories = [];
while ($cat = $category_result->fetch_assoc()) {
    $categories[] = $cat['name'];
}

$qry = $conn->query("SELECT p.id, p.name, p.price, p.img_path, p.status, c.name AS category 
                     FROM product_list p 
                     INNER JOIN category_list c ON p.category_id = c.id 
                     WHERE c.name IS NOT NULL AND c.name != ''
                     ORDER BY p.name ASC 
                     LIMIT $limit OFFSET $offset");



if (!$qry) {
    echo "SQL Error: " . $conn->error;
    exit;
}
?>

<header class="masthead">
    <div class="container h-100">
        <div class="row h-100 align-items-center justify-content-center text-center">
            <div class="col-lg-10 align-self-center mb-4 page-title">
                <h1 class="text-white">Welcome to <?php echo $_SESSION['setting_name']; ?></h1>
                <hr class="divider my-4 bg-dark" />
                <a class="btn btn-dark bg-black btn-xl js-scroll-trigger" href="#menu">Order Now</a>
            </div>
        </div>
    </div>
</header>

<section class="page-section" id="menu">
    <h1 class="text-center text-cursive" style="font-size:3em"><b>Menu</b></h1>
    <div class="category-tabs text-center mb-4">
        <button class="btn btn-filter active" data-filter="all">All</button>
        <?php foreach ($categories as $cat): ?>
    <?php if (!empty($cat) && $cat !== 'Unknown Category'): ?>
        <button class="btn btn-filter" data-filter="<?php echo $cat; ?>">
            <?php echo $cat; ?>
        </button>
    <?php endif; ?>
<?php endforeach; ?>



    </div>
    <div id="menu-field" class="menu-grid">
        <?php while ($row = $qry->fetch_assoc()): ?>
            <?php if (!empty($row['category'])): ?>
    <div class="menu-card" data-category="<?php echo $row['category']; ?>">
<?php endif; ?>

                <div class="menu-img-wrapper">
                    <img src="assets/img/<?php echo $row['img_path'] ?>" alt="<?php echo $row['name'] ?>">
                    <div class="quick-view"><i class="fa fa-eye"></i></div>
                    <div class="overlay">
                        <h5><?php echo $row['name'] ?></h5>
                        <p>RM<?php echo number_format($row['price'], 2) ?></p>
                        <div class="rating">⭐⭐⭐⭐☆</div>
                        <span class="badge <?php echo ($row['status'] == 1) ? 'badge-success' : 'badge-danger'; ?>">
                            <?php echo ($row['status'] == 1) ? 'Available' : 'Sold Out'; ?>
                        </span>
                        <button class="btn btn-cart view_prod" data-id=<?php echo $row['id'] ?> <?php echo ($row['status'] == 0) ? 'disabled' : ''; ?>>Add to Cart 🛒</button>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
    </div>
</section>

<script>
    $('.btn-filter').click(function(){
        const category = $(this).data('filter');
        $('.btn-filter').removeClass('active');
        $(this).addClass('active');
        if (category === 'all') {
            $('.menu-card').fadeIn();
        } else {
            $('.menu-card').hide();
            $('.menu-card[data-category="' + category + '"]').fadeIn();
        }
    });

    $('.view_prod').click(function(){
        const prodId = $(this).attr('data-id');
        if(prodId){
            uni_modal_right('Product Details', 'view_prod.php?id=' + prodId)
        }
    });
</script>



<style>
    .menu-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 items per row */
    gap: 20px;
    justify-content: center;
    max-width: 1200px; /* Limit max width supaya grid tak stretch terlalu besar */
    margin: auto; /* Centerkan grid */
}


    .menu-card {
        position: relative;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
        background: #fff;
    }
    .menu-card:hover {
        transform: translateY(-5px);
    }
    .menu-img-wrapper img {
        width: 100%;
        height: 300px;
        object-fit: cover;
    }
    .quick-view {
        position: absolute;
        top: 10px;
        right: 10px;
        background: #000;
        color: #fff;
        padding: 5px;
        border-radius: 50%;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    .menu-card:hover .quick-view {
        opacity: 1;
    }
    .badge {
        padding: 5px 10px;
        border-radius: 20px;
    }
    .badge-success {
        background: #28a745;
        color: #fff;
    }
    .badge-danger {
        background: #dc3545;
        color: #fff;
    }
    .btn-cart {
        background: #ffa502;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn-cart:disabled {
        background: #ccc;
        cursor: not-allowed;
    }
    .btn-cart:hover:not(:disabled) {
        background: #ff6348;
    }
    .btn-filter {
        padding: 10px 20px;
        margin: 0 10px;
        border: 2px solid #ff4757;
        border-radius: 20px;
        cursor: pointer;
        background: #fff;
        color: #ff4757;
        transition: all 0.3s ease;
    }
    .btn-filter:hover, .btn-filter.active {
        background: #ff4757;
        color: #fff;
    }
</style>
