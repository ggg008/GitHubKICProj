package subController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MasAction
{
	public abstract void execute(HttpServletRequest request, HttpServletResponse response);
}
