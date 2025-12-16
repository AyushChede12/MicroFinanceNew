package com.microfinance.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.microfinance.dto.ApiResponse;
import com.microfinance.model.User;
import com.microfinance.model.UserCreation;
import com.microfinance.model.UserToServiceMap;
import com.microfinance.repository.UserCreationRepo;
import com.microfinance.repository.UserToServiceMapRepo;
import com.microfinance.service.UserService;

@Controller
public class LoginController {

//	@Autowired
//	private UserService userService;

	@Autowired
	private UserCreationRepo userCreationRepo;

	@Autowired
	private UserToServiceMapRepo userToServiceMapRepo;

//	@PostMapping("/loginValidate")
//	public ApiResponse<User> login(@RequestBody User user, HttpSession session) {
//		if (user.getUsername() == null || user.getPassword() == null) {
//			return ApiResponse.error(HttpStatus.BAD_REQUEST, "Username and password are required");
//		}
//
//		User loginUser = userService.validateUser(user.getUsername(), user.getPassword());
//		if (loginUser != null) {
//			session.setAttribute("username", loginUser.getUsername()); // ✅ save in session
//			return ApiResponse.success(HttpStatus.OK, "Login successful", loginUser);
//		} else {
//			return ApiResponse.error(HttpStatus.UNAUTHORIZED, "Invalid username or password");
//		}
//	}
//

//	@PostMapping("/loginValidate")
//	public String loginValidate(@ModelAttribute("user") UserCreation userCreation, Model model, HttpSession session) {
//
//		if (userCreation.getUserId() != null && userCreation.getPassword() != null) {
//			UserCreation loginData = userCreationRepo.fetchMatchedData(userCreation.getUserId(),
//					userCreation.getPassword());
//			if (loginData != null) {
//				userCreationRepo.save(loginData);
//				List<UserToServiceMap> userMap = userToServiceMapRepo.getDataByuserName(userCreation.getUserId());
//				List<String> myList = new ArrayList<String>();
//				System.out.println("Userlist:" + userMap);
//				for (UserToServiceMap usr : userMap) {
//					String service = usr.getService();
//					if (service != null) {
//						String[] str = service.split(",");
//						if (str != null) {
//							for (int i = 0; i < str.length; i++) {
//								myList.add(str[i]);
//							}
//						}
//					}
//				}
//
//				session.setAttribute("user", myList);
//				session.setAttribute("UserName", loginData.getUserId());
//				return "dashboardPage/dashboard";
//			}
//
//			else {
//				model.addAttribute("msg", "Invalid username or password");
//				return "index";
//			}
//		}
//		return "dashboardPage/dashboard";
//	}
	
	
//+++++++++++++anjali+++++++++++//
	
	@PostMapping("/loginValidate")
	@ResponseBody
	public Map<String, Object> loginValidate(@RequestBody UserCreation userCreation, HttpSession session) {

		Map<String, Object> response = new HashMap<>();

		if (userCreation.getUserId() != null && userCreation.getPassword() != null) {

			UserCreation loginData = userCreationRepo.fetchMatchedData(userCreation.getUserId(),
					userCreation.getPassword());

			if (loginData != null) {

				// Save login record (optional)
				userCreationRepo.save(loginData);

				// Fetch user-services mapping
				List<UserToServiceMap> userMap = userToServiceMapRepo.getDataByuserName(userCreation.getUserId());

				List<String> myList = new ArrayList<>();

				for (UserToServiceMap usr : userMap) {
					if (usr.getService() != null) {
						for (String s : usr.getService().split(",")) {
							myList.add(s);
						}
					}
				}

				// Session Attributes
				System.out.println("hii " + loginData.getUserId());
				session.setAttribute("user", myList);
				session.setAttribute("UserName", loginData.getUserId());

				// Success response
				response.put("status", "success");
				response.put("redirectUrl", "/openDashboard");

				return response;
			}
		}

		// Error response
		response.put("status", "error");
		response.put("message", "Invalid username or password");
		return response;
	}

	@GetMapping("/openDashboard")
	public String openDashboard(HttpSession session, Model model) {
		String username = (String) session.getAttribute("UserName");
		System.out.println(username);
		if (username == null) {
			return "/"; // not logged in → go back
		}
		model.addAttribute("customerUser", username); // ✅ pass to JSP
		return "dashboardPage/dashboard"; // dashboard.jsp

	}
	
	@GetMapping("/getUserServices")
	@ResponseBody
	public List<String> getUserServices(HttpSession session) {
	    List<String> services = (List<String>) session.getAttribute("user");
	    if (services == null) {
	        return new ArrayList<>();
	    }
	    return services;

	}

}