package com.Controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.ProfileDaoImpl;
import com.Dao.OrderInfoDaoImpl;
import com.Dao.ProductDaoImpl;
import com.Entity.Cart;
import com.Entity.Login;
import com.Entity.OrderInfo;
import com.Entity.Product;
import com.Entity.Profile;

@RestController
public class Controller {

	Cart cart = new Cart();

	@GetMapping("/")
	public ModelAndView home() {
		return new ModelAndView("homePage");
	}

	@GetMapping("/login")
	public ModelAndView loginPage() {
		Login l = new Login();
		return new ModelAndView("login", "Login", l);
	}

	@PostMapping("/loginattempt")
	public ModelAndView login(@ModelAttribute Login l, HttpSession session) {
		ProfileDaoImpl profileDao = new ProfileDaoImpl();
		boolean status = profileDao.verifyLogin(l.getUsername(), l.getPassword(), session);

		if (status == true) {
			return new ModelAndView("redirect:/");
		} else {
			return new ModelAndView("redirect:/login");
		}

	}

	@GetMapping("/register")
	public ModelAndView registerPage() {
		Profile p = new Profile();
		return new ModelAndView("register", "Profile", p);
	}

	@PostMapping("/registersuccess")
	public ModelAndView register(@ModelAttribute Profile p, HttpSession session) {
		ProfileDaoImpl profileDao = new ProfileDaoImpl();
		profileDao.addAccount(p);
		session.setAttribute("username", p.getUsername());
		return new ModelAndView("redirect:/");
	}

	@GetMapping("/products")
	public ModelAndView productsPage() {
		return new ModelAndView("productsPage");
	}

	@GetMapping("/cart")
	public ModelAndView showCart(HttpSession session) {
		session.setAttribute("cart", cart);
		return new ModelAndView("cart");
	}

	@GetMapping("/editprofile")
	public ModelAndView editProfile(HttpSession session) {
		if (((String) session.getAttribute("username")).equalsIgnoreCase("admin")) {
			return new ModelAndView("adminPage");
		} else {
			Profile p = new Profile();
			return new ModelAndView("editProfile", "Profile", p);
		}
	}

	@PostMapping("/editsuccess")
	public ModelAndView submitProfileEdit(@ModelAttribute Profile p) {
		ProfileDaoImpl pDao = new ProfileDaoImpl();
		pDao.editAccount(p);
		return new ModelAndView("redirect:/");
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.setAttribute("username", null);
		return new ModelAndView("redirect:/");
	}

	@GetMapping("/addProduct")
	public ModelAndView addProduct() {
		ProductDaoImpl pDao = new ProductDaoImpl();
		pDao.addProduct(new Product(
				"https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.Y-931eiIboA3XFd_KzV-MAAAAA%26pid%3DApi&f=1",
				"Guitar", "instrument", "new", 500));
		return new ModelAndView("redirect:/");
	}

	@GetMapping("/viewProduct")
	public ModelAndView viewProduct(@RequestParam("id") int id, HttpSession session) {
		ProductDaoImpl productDao = new ProductDaoImpl();
		session.setAttribute("product", productDao.getProductById(id));
		return new ModelAndView("viewProduct");
	}

	@GetMapping("/addToCart")
	public ModelAndView addToCart(@RequestParam("id") int id) {
		ProductDaoImpl productDao = new ProductDaoImpl();
		Product p = productDao.getProductById(id);
		cart.addToCart(p);
		return new ModelAndView("redirect:/cart");
	}

	@GetMapping("/createOrder")
	public ModelAndView createOrder(HttpSession session) {

		if (session.getAttribute("username") == null) {
			return new ModelAndView("redirect:/login");
		} else {
			OrderInfoDaoImpl oiDao = new OrderInfoDaoImpl();
			OrderInfo oi = new OrderInfo();
			oi.setOrderContents(cart.getCart());
			oiDao.createOrder(oi);
			session.setAttribute("currentOrderId", oi.getId());
			cart.clearCart();
			session.setAttribute("cart", null);
			return new ModelAndView("redirect:/showOrder");
		}
	}

	@GetMapping("showOrder")
	public ModelAndView showOrder() {
		return new ModelAndView("showOrder");
	}
	
	@GetMapping("/removeFromCart")
	public ModelAndView removeFromCart(@RequestParam("id") int id, HttpSession session) {
		cart.remove(id);
		return new ModelAndView("redirect:/cart");
	}
	
	@GetMapping("/enterBillingInfo")
	public ModelAndView enterBillingInfo() {
		return new ModelAndView("enterBillingInfo");
	}
	
	@GetMapping("/paymentSuccess")
	public ModelAndView paymentSuccess() {
		return new ModelAndView("homePage");
	}

}
