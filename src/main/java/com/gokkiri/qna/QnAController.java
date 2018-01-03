package com.gokkiri.qna;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.qna.QnAService;
import com.gokkiri.area.AreaService;

import com.gokkiri.qna.QnAModel;
import com.gokkiri.area.AreaModel;

@Controller
@RequestMapping("/qna")
public class QnAController {
	
	@Resource
	private QnAService qnAService;
	
	@Resource
	private AreaService areaService;
	
	private String m_email;
	private int q_no;
	
	
	/*글목록*/
	@RequestMapping("qnaList.go")
	public ModelAndView qnaList( HttpServletRequest request) throws Exception{
	
		ModelAndView mav = new ModelAndView();
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		List<QnAModel> qnaList = qnAService.qnaList(a_no);
		AreaModel areaModel = areaService.areaDetail(a_no);
		String main_img = areaService.main_img(a_no);
		/*int comCount = qnAService.comCount(a_no);*/
	
		/*mav.addObject("comCount", comCount);*/
		mav.addObject("main_img", main_img);
		mav.addObject("areaModel", areaModel);
		mav.addObject("qnaList", qnaList);
		mav.setViewName("qnaList");
		return mav;
}
	
	//qna글쓰기폼
	@RequestMapping("qnaWriteForm.go")
	public ModelAndView qnaForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		int a_no = Integer.parseInt(request.getParameter("a_no"));
		QnAModel qnaModel = new QnAModel();
		AreaModel areaModel = areaService.areaDetail(a_no);
		String main_img = areaService.main_img(a_no);
		
		mav.addObject("main_img", main_img);
		mav.addObject("areaModel", areaModel);
		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaWrite");
		return mav;
	}
	
	//qna글쓰기
	@RequestMapping("qnaWrite.go")
	public ModelAndView qnaWrite(@ModelAttribute("qnaModel") QnAModel qnaModel, HttpServletRequest request,
			HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		
		/*줄바꿈*/
		String q_con = qnaModel.getQ_con().replaceAll("\r\n", "<br />");
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		
		qnaModel.setA_no(a_no);
		qnaModel.setQ_con(q_con);
		
		int q_no = qnaModel.getQ_no();
		
		qnAService.qnaWrite(qnaModel);
	
		mav.addObject("QnAModel", qnaModel);
		mav.setViewName("redirect:/qna/qnaList.go?a_no="+a_no);
		
		return mav;
	
	}
	
	//qna상세보기
	@RequestMapping("qnaView.go")
	public ModelAndView qnaView(HttpServletRequest request,HttpSession session){
	
		ModelAndView mav =  new ModelAndView();

		int a_no = Integer.parseInt(request.getParameter("a_no"));
		int q_no = Integer.parseInt(request.getParameter("q_no"));
	
		QnAModel qnAModel = qnAService.qnaView(q_no);
		AreaModel areaModel = areaService.areaDetail(a_no);
		String main_img = areaService.main_img(a_no);
		
		
		List<QnAModel> qnacommList;
		qnacommList = qnAService.qnacommList(q_no);
	
		mav.addObject("main_img", main_img);
		mav.addObject("areaModel", areaModel);
		mav.addObject("qnacommList", qnacommList);
		mav.addObject("qnAModel",qnAModel);
		mav.setViewName("qnaView");
		
		return mav;
	}
	
	//qna글수정
	@RequestMapping("qnaModify.go")
	public ModelAndView qnaModify(HttpServletRequest request,QnAModel qnaModel){
		
		ModelAndView mav = new ModelAndView();
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		
		AreaModel areaModel = areaService.areaDetail(a_no);
		String main_img = areaService.main_img(a_no);
        qnaModel = qnAService.qnaView(qnaModel.getQ_no());
        String q_con = qnaModel.getQ_con().replaceAll("\r\n", "<br/>");
        qnaModel.setQ_con(q_con);
        
        mav.addObject("main_img", main_img);
		mav.addObject("areaModel", areaModel);
        mav.addObject("qnaModel", qnaModel);
        mav.setViewName("qnaModify");
/*        mav.setViewName("redirect:/qna/qnaView.go?q_no=" + qnaModel.getQ_no());*/
        return mav;
        }
	
    @RequestMapping("qnaModifySuccess.go")
	public ModelAndView qnaModify(@ModelAttribute("qnaModel") QnAModel qnaModel, HttpServletRequest request){
		ModelAndView mav =  new ModelAndView();
		String q_con = qnaModel.getQ_con().replaceAll("\r\n", "<br/>");
		qnaModel.setQ_con(q_con);
		
	
		qnAService.qnaModify(qnaModel);
		
		mav.setViewName("redirect:/qna/qnaView.go?q_no=" + qnaModel.getQ_no());
		return mav;
		
	}

	//qna 글 삭제하기
	@RequestMapping("qnaDelete.go")
	public String areaDelete(HttpServletRequest request){
		
		int q_no = Integer.parseInt(request.getParameter("q_no"));
		
		qnAService.qnaDelete(q_no);
		
		return "redirect:qnaList.go?a_cate=0";
	}
	
	

	//댓글작성
	@RequestMapping("qnacommWrite.go")
	public ModelAndView qnacommWrite( QnAModel qnAModel, HttpServletRequest request,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		int q_no = qnAModel.getQ_no();
		m_email = qnAModel.getM_email();
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		
		String q_co_con = qnAModel.getQ_co_con().replaceAll("\r\n", "<br />");
		
		qnAModel.setQ_co_con(q_co_con);
		qnAModel.setQ_no(q_no);
		qnAModel.setM_email(m_email);
		
		qnAService.qnacommWrite(qnAModel);
	
		mav.setViewName("redirect:/qna/qnaView.go?q_no=" + q_no + "&a_no="+a_no);

		return mav;
	}
	
	
    //댓글삭제
	@RequestMapping("qnacommDelete.go")
	public ModelAndView qnacommDelete(HttpServletRequest request,  QnAModel qnAModel,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		// System.out.println("시작할때 댓글번호 : " + qnacommModel.getComment_num());
		// System.out.println("댓글쓴사람 : "+
		// session.getAttribute("session_member_id"));

		int q_co_no = Integer.parseInt(request.getParameter("q_co_no"));

		qnAService.qnacommDelete(qnAModel);
		// 지우는SQL 실행

		qnAService.qnaView(qnAModel.getQ_no());
		 m_email = (String) session.getAttribute("session_m_email");
		/*m_email = (String) session.getAttribute("session_m_email");*/
		// System.out.println("쿼리실행후 코멘터"+commenter);



		mav.setViewName("redirect:/qna/qnaView.go?q_no=" + qnAModel.getQ_no());

		return mav;
	}
	
	/*도시 상세보기에서 QNA전체페이지로 넘어가기*/
	@RequestMapping("cityqnaList.go")
	public ModelAndView cityqnaList( HttpServletRequest request) throws Exception{
	
	ModelAndView mav = new ModelAndView();
	int c_no = Integer.parseInt(request.getParameter("c_no"));
	
	List<QnAModel> cityqnaList = qnAService.cityqnaList(c_no);  
 
	mav.addObject("cityqnaList", cityqnaList);
	mav.setViewName("cityqnaList");
	return mav;
	}
	
	
}