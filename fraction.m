% constructor , object, class


classdef fraction %file name same as class name

    properties(Access = private)
        numerator {mustBeInteger,mustBePositive}
        denominator {mustBeInteger,mustBePositive}
    end
    methods %(Access = public) the default access is public so writing (Access = public) or not doesnot matter

        function obj = fraction(arg1,arg2)

            if nargin == 1
                obj.numerator = arg1;
                obj.denominator = 1;
            elseif nargin == 0
                error('there is no input');
            elseif nargin == 2
                if obj.denominator == 0
                    error('the denominator cannot be zero');
                end

                obj.numerator = arg1;
                obj.denominator = arg2;
                obj = obj.reduce();

                % if obj.denominator == 1
                %     a = strcat(num2str(obj.numerator));
                %     disp(a);
                % else
                % a = strcat(num2str(obj.numerator),'/',num2str(obj.denominator));
                % disp(a); using disp function over here will show
                % result below function and not in variable

            end
        end

        function disp(obj)
                % for single fraction
            if isscalar(obj) == 1 
                fprintf('%s\n',obj.num2str());
            else
                % for matrix fraction
                [row,col] = size(obj);
                for i= 1:row
                    rowstr = '';
                    for j = 1:col
                        rowstr = [rowstr, obj(i,j).num2str(), ' '];
                    end
                    fprintf('%s\n',rowstr);
                end

            end
        end

        function obj = plus(obj1,obj2)
            % obj.numerator = obj1;
            % obj.denominator = obj2;
            num = obj1.numerator*obj2.denominator + obj2.numerator*obj1.denominator;
            den = obj1.denominator*obj2.denominator;
            obj = fraction(num,den); % obj1.numerator + obj2.denominator;
            %disp(adding) we donot have to do this step

        end
        function obj = minus(obj1,obj2)
            num = obj1.numerator*obj2.denominator - obj2.numerator*obj1.denominator;
            den = obj1.denominator*obj2.denominator;
            obj = fraction(num,den);

        end
        function obj = mtimes(obj1,obj2)
            num = obj1.numerator*obj2.numerator;
            den = obj1.denominator*obj2.denominator;
            obj = fraction(num,den);
        end
        function obj = mrdivide(obj1,obj2)
            num = obj1.numerator*obj2.denominator;
            den = obj1.denominator*obj2.numerator;
            obj = fraction(num,den);
        end
        function b = eq(obj1,obj2)
            obj1 = obj1.reduce();
            obj2 = obj2.reduce();
            b = (obj1.numerator == obj2.numerator) && (obj1.denominator == obj2.denominator);
        end

    end
    methods(Access = private)
        function obj = reduce(obj)
            [obj.numerator,obj.denominator] = rat(obj.numerator/obj.denominator);
        end
        function str = num2str(obj)
            if obj.denominator == 1
                str = sprintf('%d',obj.numerator);
            else
                str = sprintf('%d/%d',obj.numerator,obj.denominator);
            end
        end
    end
end

